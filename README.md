# 交通场景交互式编辑

该工程实现语音控制交通场景的编辑。

## 流程

### 语音识别

[使用深度学习训练语音命令识别模型](https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/train-speech-command-recognition-model-using-deep-learning.html)


### 自然语言理解

使用 GPT 总结文本
GPT 等 Transformer 网络可用于总结一段文本。
经过训练的 GPT 转换器可以在给定初始单词序列作为输入的情况下生成文本。
该模型根据各种网页和互联网论坛上留下的评论进行训练。

由于许多这些注释本身包含由语句“TL;DR”（太长，没读）指示的摘要，因此您可以使用转换器模型通过将“TL;DR”附加到输入文本来生成摘要。
该generateSummary函数接受输入文本，自动附加字符串"TL;DR"并生成摘要。

该示例`transformer/SummarizeTextUsingTransformersExample.m`展示了如何使用 GPT 总结成一个交通场景编辑指令（一段文本）。


### 场景编辑的控制

拟实现的功能包括(Driving Scenario Editor和Roadrunner)：
1. 增加、删除场景中的车辆、行人等交通参与者，修改交通参与者的属性，查询场景中有多少车（增删改查）；
2. 将摄像机、激光雷达等传感器放置到某台车上；
3. 场景中车辆加速减速；
4. 变道、超车、加塞操作；
5. 仿真场景运行过程中制造交通事故；
6. 创建单元测试场景；
7. [以编程方式创建驾驶场景](https://ww2.mathworks.cn/help/driving/ug/create-driving-scenario-programmatically.html) ；
8. [生成三维模型](https://github.com/uezo/ChatdollKit) ；



## 要求

### BERT and FinBERT
- MATLAB R2021a或以上
- 深度学习工具箱
- 文本分析工具箱

### GPT
MATLAB R2020a或以上
深度学习工具箱

# 环境配置

## 贡献指南
在进行代码之前，请阅读 [贡献指南](https://github.com/OpenHUTB/bazaar/blob/master/CONTRIBUTING.md) 文档。

##  参考
[matlab 实现 GPT2](https://github.com/matlab-deep-learning/transformer-models)

[代码生成服务](https://github.com/fauxpilot/fauxpilot) 

[多语言代码生成模型](https://github.com/THUDM/CodeGeeX) 

[Matlab和OpenAI进行通信的App](https://github.com/toshiakit/MatGPT)

[生成Python](https://github.com/microsoft/PyCodeGPT) 

