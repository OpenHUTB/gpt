%% 代码引用：https://blog.csdn.net/guoxiaojie_415/article/details/21317323
% 获取目录所有文件的路径
function [ mFiles ] = RangTraversal( strPath )
    %定义两数组，分别保存文件和路径
    mFiles = cell(0,0);
    mPath  = cell(0,0);
    
    mPath{1}=strPath;
    [r,c] = size(mPath);
    while c ~= 0
        strPath = mPath{1};
        Files = dir(strPath);
        LengthFiles = length(Files);
        if LengthFiles == 0
            break;
        end
        mPath(1)=[];
        iCount = 1;
        while LengthFiles>0
            if Files(iCount).isdir==1
                if Files(iCount).name ~='.'
                    filePath = [strPath filesep  Files(iCount).name];
                    [r,c] = size(mPath);
                    mPath{c+1}= filePath;
                end
            else
                filePath = [strPath filesep Files(iCount).name];
                [row,col] = size(mFiles);
                mFiles{col+1}=filePath;
            end

            LengthFiles = LengthFiles-1;
            iCount = iCount+1;
        end
        [r,c] = size(mPath);
    end

    mFiles = mFiles';
end

%% 示例
% clc
% clear
% close all
% 
% %% The directory of your files
% str = 'C:\test\';
% 
% %% The use of depth-first walk
% mFiles = [];
% [mFiles, iFilesCount] = DeepTravel(str,mFiles,0)
% mFiles = mFiles';
% 
% %% The use of breadth first walk
% mFiles2 = RangTraversal(str)
