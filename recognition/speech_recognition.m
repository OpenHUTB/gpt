%% 使用深度学习训练语音命令识别模型
% 此示例演示如何训练深度学习模型来检测音频中是否存在语音命令。该示例使用语音命令数据集<https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/train-speech-command-recognition-model-using-deep-learning.html#mw_rtc_DeepLearningSpeechRecognitionExample_M_382DD437 
% [1]>训练卷积神经网络来识别一组命令。
% 
% 要使用预训练的语音命令识别系统，请参阅<https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/speech-command-recognition-using-deep-learning.html 
% 使用深度学习的语音命令识别>。
% 
% 
%% 
% 要快速运行该示例，请设置|speedupExample|为|true|。要运行已发布的完整示例，请设置|speedupExample|为|false|。

speedupExample = false;
%% 
% 设置随机种子以实现可重复性。

rng default
%% *加载数据*
% 此示例使用 Google 语音命令数据集<https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/train-speech-command-recognition-model-using-deep-learning.html#mw_rtc_DeepLearningSpeechRecognitionExample_M_382DD437 
% [1]>。下载并解压数据集。

downloadFolder = matlab.internal.examples.downloadSupportFile("audio","google_speech.zip");
dataFolder = tempdir;
unzip(downloadFolder,dataFolder)
dataset = fullfile(dataFolder,"google_speech");
%% *增强数据*
% 网络不仅应该能够识别不同的口语单词，还应该能够检测音频输入是静音还是背景噪音。
% 
% 支持功能 ，<https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/train-speech-command-recognition-model-using-deep-learning.html#mw_rtc_DeepLearningSpeechRecognitionExample_M_DCA98732 
% |augmentDataset|>使用 Google 语音命令数据集背景文件夹中的长音频文件来创建一秒的背景噪音片段。该函数从每个背景噪声文件创建相同数量的背景片段，然后在训练文件夹和验证文件夹之间分割这些片段。

augmentDataset(dataset)
%% *创建训练数据存储*
% 创建一个<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.html 
% |audioDatastore|>指向训练数据集的数据集。

ads = audioDatastore(fullfile(dataset,"train"), ...
    IncludeSubfolders=true, ...
    FileExtensions=".wav", ...
    LabelSource="foldernames");
%% 
% 指定您希望模型将其识别为命令的单词。将所有非命令或背景噪音的文件标记为|unknown|. 将不是命令的单词标记为|unknown|创建一组单词，该组单词近似于除命令之外的所有单词的分布。网络使用该组来学习命令和所有其他单词之间的区别。
% 
% 为了减少已知词和未知词之间的类别不平衡并加快处理速度，只需在训练集中包含一小部分未知词。
% 
% 用于<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.subset.html 
% |subset|>创建仅包含命令、背景噪音和未知单词子集的数据存储。计算属于每个类别的示例数量。

commands = categorical(["yes","no","up","down","left","right","on","off","stop","go"]);
background = categorical("background");

isCommand = ismember(ads.Labels,commands);
isBackground = ismember(ads.Labels,background);
isUnknown = ~(isCommand|isBackground);

includeFraction = 0.2; % Fraction of unknowns to include.
idx = find(isUnknown);
idx = idx(randperm(numel(idx),round((1-includeFraction)*sum(isUnknown))));
isUnknown(idx) = false;

ads.Labels(isUnknown) = categorical("unknown");

adsTrain = subset(ads,isCommand|isUnknown|isBackground);
adsTrain.Labels = removecats(adsTrain.Labels);
%% *创建验证数据存储*
% 创建一个<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.html 
% |audioDatastore|>指向验证数据集。请遵循用于创建训练数据存储的相同步骤。

ads = audioDatastore(fullfile(dataset,"validation"), ...
    IncludeSubfolders=true, ...
    FileExtensions=".wav", ...
    LabelSource="foldernames");

isCommand = ismember(ads.Labels,commands);
isBackground = ismember(ads.Labels,background);
isUnknown = ~(isCommand|isBackground);

includeFraction = 0.2; % Fraction of unknowns to include.
idx = find(isUnknown);
idx = idx(randperm(numel(idx),round((1-includeFraction)*sum(isUnknown))));
isUnknown(idx) = false;

ads.Labels(isUnknown) = categorical("unknown");

adsValidation = subset(ads,isCommand|isUnknown|isBackground);
adsValidation.Labels = removecats(adsValidation.Labels);
%% 
% 可视化训练和验证标签分布。

figure(Units="normalized",Position=[0.2,0.2,0.5,0.5])

tiledlayout(2,1)

nexttile
histogram(adsTrain.Labels)
title("Training Label Distribution")
ylabel("Number of Observations")
grid on

nexttile
histogram(adsValidation.Labels)
title("Validation Label Distribution")
ylabel("Number of Observations")
grid on
%% 
% 如果需要，可以通过减少数据集来加快示例速度。

if speedupExample
    numUniqueLabels = numel(unique(adsTrain.Labels)); %#ok<UNRCH> 
    % Reduce the dataset by a factor of 20
    adsTrain = splitEachLabel(adsTrain,round(numel(adsTrain.Files) / numUniqueLabels / 20));
    adsValidation = splitEachLabel(adsValidation,round(numel(adsValidation.Files) / numUniqueLabels / 20));
end
%% *准备训练数据*
% 为了准备有效训练卷积神经网络的数据，请将语音波形转换为基于听觉的声谱图。
% 
% 为了加快处理速度，您可以将特征提取分配给多个工作人员。如果您有权访问 ParallelComputingToolbox™，请启动并行池。

if canUseParallelPool && ~speedupExample
    useParallel = true;
    gcp;
else
    useParallel = false;
end
%% *提取特征*
% 定义参数以从音频输入中提取听觉频谱图。|segmentDuration|是每个语音片段的持续时间（以秒为单位）。|frameDuration|是频谱计算的每帧的持续时间。|hopDuration|是每个频谱之间的时间步长。|numBands|是听觉频谱图中滤波器的数量。

fs = 16e3; % Known sample rate of the data set.

segmentDuration = 1;
frameDuration = 0.025;
hopDuration = 0.010;

FFTLength = 512;
numBands = 50;

segmentSamples = round(segmentDuration*fs);
frameSamples = round(frameDuration*fs);
hopSamples = round(hopDuration*fs);
overlapSamples = frameSamples - hopSamples;
%% 
% 创建一个<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiofeatureextractor.html 
% |audioFeatureExtractor|>对象来执行特征提取。

afe = audioFeatureExtractor( ...
    SampleRate=fs, ...
    FFTLength=FFTLength, ...
    Window=hann(frameSamples,"periodic"), ...
    OverlapLength=overlapSamples, ...
    barkSpectrum=true);
setExtractorParameters(afe,"barkSpectrum",NumBands=numBands,WindowNormalization=false);
%% 
% 定义一系列<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.transform.html 
% |transform|>将<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.html 
% |audioDatastore|>音频填充到一致的长度，提取特征，然后应用对数。
% 
% 

transform1 = transform(adsTrain,@(x)[zeros(floor((segmentSamples-size(x,1))/2),1);x;zeros(ceil((segmentSamples-size(x,1))/2),1)]);
transform2 = transform(transform1,@(x)extract(afe,x));
transform3 = transform(transform2,@(x){log10(x+1e-6)});
%% 
% 使用该<https://ww2.mathworks.cn/help/releases/R2022b/audio/ref/audiodatastore.readall.html 
% |readall|>函数从数据存储中读取所有数据。读取每个文件时，在返回数据之前会先对其进行转换。
% 
% 

XTrain = readall(transform3,UseParallel=useParallel);
%% 
% 输出是一个|numFiles|×1 元胞数组。元胞数组的每个元素对应于从文件中提取的听觉频谱图。

numFiles = numel(XTrain)
[numHops,numBands,numChannels] = size(XTrain{1})
%% 
% 将元胞数组转换为 4 维数组，其中听觉频谱图沿第四维排列。

XTrain = cat(4,XTrain{:});

[numHops,numBands,numChannels,numFiles] = size(XTrain)
%% 
% 在验证集上执行上述特征提取步骤。

transform1 = transform(adsValidation,@(x)[zeros(floor((segmentSamples-size(x,1))/2),1);x;zeros(ceil((segmentSamples-size(x,1))/2),1)]);
transform2 = transform(transform1,@(x)extract(afe,x));
transform3 = transform(transform2,@(x){log10(x+1e-6)});
XValidation = readall(transform3,UseParallel=useParallel);
XValidation = cat(4,XValidation{:});
%% 
% 为了方便起见，隔离训练和验证目标标签。

TTrain = adsTrain.Labels;
TValidation = adsValidation.Labels;
%% *可视化数据*
% 绘制一些训练样本的波形和听觉频谱图。播放相应的音频片段。

specMin = min(XTrain,[],"all");
specMax = max(XTrain,[],"all");
idx = randperm(numel(adsTrain.Files),3);
figure(Units="normalized",Position=[0.2,0.2,0.6,0.6]);

tiledlayout(2,3)
for ii = 1:3
    [x,fs] = audioread(adsTrain.Files{idx(ii)});

    nexttile(ii)
    plot(x)
    axis tight
    title(string(adsTrain.Labels(idx(ii))))
    
    nexttile(ii+3)
    spect = XTrain(:,:,1,idx(ii))';
    pcolor(spect)
    clim([specMin specMax])
    shading flat
    
    sound(x,fs)
    pause(2)
end
%% *定义网络架构*
% 创建一个简单的网络架构作为层数组。使用卷积和批量归一化层，并使用最大池化层“空间”（即时间和频率）对特征图进行下采样。添加最终的最大池化层，随着时间的推移，对输入特征图进行全局池化。这在输入频谱图中强制执行（近似）时间平移不变性，允许网络执行相同的分类，而与语音在时间上的确切位置无关。全局池化还显着减少了最终全连接层中的参数数量。为了减少网络记住训练数据特定特征的可能性，请在最后一个全连接层的输入中添加少量的dropout。
% 
% 该网络很小，因为它只有五个卷积层和很少的滤波器。|numF|控制卷积层中滤波器的数量。为了提高网络的准确性，请尝试通过添加相同的卷积层、批量归一化层和 
% ReLU 层来增加网络深度。您还可以尝试通过增加 来增加卷积滤波器的数量|numF|。
% 
% 为了使每个类别的损失总权重相等，请使用与每个类别中的训练示例数量成反比的类别权重。当使用 Adam 优化器训练网络时，训练算法独立于类权重的整体归一化。
% 
% 

classes = categories(TTrain);
classWeights = 1./countcats(TTrain);
classWeights = classWeights'/mean(classWeights);
numClasses = numel(classes);

timePoolSize = ceil(numHops/8);

dropoutProb = 0.2;
numF = 12;
layers = [
    imageInputLayer([numHops,afe.FeatureVectorLength])
    
    convolution2dLayer(3,numF,Padding="same")
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(3,Stride=2,Padding="same")
    
    convolution2dLayer(3,2*numF,Padding="same")
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(3,Stride=2,Padding="same")
    
    convolution2dLayer(3,4*numF,Padding="same")
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(3,Stride=2,Padding="same")
    
    convolution2dLayer(3,4*numF,Padding="same")
    batchNormalizationLayer
    reluLayer

    convolution2dLayer(3,4*numF,Padding="same")
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer([timePoolSize,1])
    dropoutLayer(dropoutProb)

    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer(Classes=classes,ClassWeights=classWeights)];
%% Specify Training Options
% To define parameters for training, use <docid:nnet_ref#bu59f0q |trainingOptions|>. 
% Use the Adam optimizer with a mini-batch size of 128.

miniBatchSize = 128;
validationFrequency = floor(numel(TTrain)/miniBatchSize);
options = trainingOptions("adam", ...
    InitialLearnRate=3e-4, ...
    MaxEpochs=15, ...
    MiniBatchSize=miniBatchSize, ...
    Shuffle="every-epoch", ...
    Plots="training-progress", ...
    Verbose=false, ...
    ValidationData={XValidation,TValidation}, ...
    ValidationFrequency=validationFrequency);
%% 
% *指定训练培训选项*
% 
% 要定义训练参数，请使用(Deep Learning Toolbox)。使用小批量大小为 128 的 Adam 优化器。<https://ww2.mathworks.cn/help/releases/R2022b/deeplearning/ref/trainingoptions.html 
% |trainingOptions|>

trainedNet = trainNetwork(XTrain,TTrain,layers,options);
%% 
% *评估经过训练的网络*
% 
% 要计算网络在训练集和验证集上的最终准确性，请使用(Deep Learning Toolbox)。网络在这个数据集上非常准确。然而，训练、验证和测试数据都具有相似的分布，不一定反映真实环境。此限制尤其适用于仅包含少量单词的话语的类别。<https://ww2.mathworks.cn/help/releases/R2022b/deeplearning/ref/seriesnetwork.classify.html 
% |classify|>|unknown|

YValidation = classify(trainedNet,XValidation);
validationError = mean(YValidation ~= TValidation);
YTrain = classify(trainedNet,XTrain);
trainError = mean(YTrain ~= TTrain);

disp(["Training error: " + trainError*100 + "%";"Validation error: " + validationError*100 + "%"])
%% 
% 要绘制验证集的混淆矩阵，请使用(Deep Learning Toolbox)。使用列和行摘要显示每个类别的精度和召回率。<https://ww2.mathworks.cn/help/releases/R2022b/deeplearning/ref/confusionchart.html 
% |confusionchart|>

figure(Units="normalized",Position=[0.2,0.2,0.5,0.5]);
cm = confusionchart(TValidation,YValidation, ...
    Title="Confusion Matrix for Validation Data", ...
    ColumnSummary="column-normalized",RowSummary="row-normalized");
sortClasses(cm,[commands,"unknown","background"])
%% 
% 在处理硬件资源受限的应用程序（例如移动应用程序）时，重要的是要考虑可用内存和计算资源的限制。计算网络的总大小（以千字节为单位）并测试使用 CPU 时的预测速度。预测时间是对单个输入图像进行分类的时间。如果您向网络输入多个图像，则可以同时对这些图像进行分类，从而缩短每个图像的预测时间。然而，在对流音频进行分类时，单图像预测时间是最相关的。

for ii = 1:100
    x = randn([numHops,numBands]);
    predictionTimer = tic;
    [y,probs] = classify(trainedNet,x,ExecutionEnvironment="cpu");
    time(ii) = toc(predictionTimer);
end

disp(["Network size: " + whos("trainedNet").bytes/1024 + " kB"; ...
"Single-image prediction time on CPU: " + mean(time(11:end))*1000 + " ms"])
%% 支持函数
% *使用背景噪声增强数据集*

function augmentDataset(datasetloc)
adsBkg = audioDatastore(fullfile(datasetloc,"background"));
fs = 16e3; % Known sample rate of the data set
segmentDuration = 1;
segmentSamples = round(segmentDuration*fs);

volumeRange = log10([1e-4,1]);

numBkgSegments = 4000;
numBkgFiles = numel(adsBkg.Files);
numSegmentsPerFile = floor(numBkgSegments/numBkgFiles);

fpTrain = fullfile(datasetloc,"train","background");
fpValidation = fullfile(datasetloc,"validation","background");

if ~datasetExists(fpTrain)

    % Create directories
    mkdir(fpTrain)
    mkdir(fpValidation)

    for backgroundFileIndex = 1:numel(adsBkg.Files)
        [bkgFile,fileInfo] = read(adsBkg);
        [~,fn] = fileparts(fileInfo.FileName);

        % Determine starting index of each segment
        segmentStart = randi(size(bkgFile,1)-segmentSamples,numSegmentsPerFile,1);

        % Determine gain of each clip
        gain = 10.^((volumeRange(2)-volumeRange(1))*rand(numSegmentsPerFile,1) + volumeRange(1));

        for segmentIdx = 1:numSegmentsPerFile

            % Isolate the randomly chosen segment of data.
            bkgSegment = bkgFile(segmentStart(segmentIdx):segmentStart(segmentIdx)+segmentSamples-1);

            % Scale the segment by the specified gain.
            bkgSegment = bkgSegment*gain(segmentIdx);

            % Clip the audio between -1 and 1.
            bkgSegment = max(min(bkgSegment,1),-1);

            % Create a file name.
            afn = fn + "_segment" + segmentIdx + ".wav";

            % Randomly assign background segment to either the train or
            % validation set.
            if rand > 0.85 % Assign 15% to validation
                dirToWriteTo = fpValidation;
            else % Assign 85% to train set.
                dirToWriteTo = fpTrain;
            end

            % Write the audio to the file location.
            ffn = fullfile(dirToWriteTo,afn);
            audiowrite(ffn,bkgSegment,fs)

        end

        % Print progress
        fprintf('Progress = %d (%%)\n',round(100*progress(adsBkg)))

    end
end
end
%%