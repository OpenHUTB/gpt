# 交通大模型

该工程实现人类语音进行交通场景的编辑和控制。

# 流程

技术路线包括以下三个步骤：

## [语音识别](https://github.com/OpenHUTB/gpt/tree/main/recognition) 

将中文语音对话转换成文本，供 [代码生成模块](https://github.com/OpenHUTB/gpt/tree/main/webui) 使用，参考[使用深度学习训练语音命令识别模型](https://ww2.mathworks.cn/help/releases/R2022b/audio/ug/train-speech-command-recognition-model-using-deep-learning.html) 。


## [代码生成](https://github.com/OpenHUTB/gpt/tree/main/webui) 

1. 运行[大模型代码生成](https://github.com/OpenHUTB/gpt/blob/main/webui/training_wizardcoder_mydata.py) ，并根据语音识别模块生成`matlab`代码；
2. 使用matlab软件自带代码和github上的成熟matlab仓库进行模型微调（可选）。
3. 根据matlab代码生成对应的交通场景，并在 [编辑器](https://marketplace.visualstudio.com/items?itemName=MathWorks.language-matlab) 中进行集成。


## [场景交互](https://github.com/OpenHUTB/gpt/tree/main/sim) 

拟实现的编辑和控制功能包括（使用自动驾驶场景设计器）：
1. 增加、删除场景中的车辆、行人等交通参与者，修改交通参与者的属性，查询场景中有多少车（增删改查）；
2. 将摄像机、激光雷达等传感器放置到某台车上；
3. 场景中车辆加速减速；
4. 变道、超车、加塞操作；
5. 仿真场景运行过程中制造交通事故；
6. 创建单元测试场景；
7. [以编程方式创建驾驶场景](https://ww2.mathworks.cn/help/driving/ug/create-driving-scenario-programmatically.html) ；
8. [生成三维模型](https://github.com/uezo/ChatdollKit) ；






# 环境配置

## 大模型配置

一键运行大模型对话和代码生成的工具在[百度网盘链接](https://pan.baidu.com/s/1n2fJvWff4pbtMe97GOqtvQ?pwd=hutb) 的“学习->大模型”目录下，”WizardLM演示视频.mp4“展示了如何运行和测试这个模型的详细步骤。以下是进行代码调试的环境部署步骤：

1. 将[百度网盘链接](https://pan.baidu.com/s/1n2fJvWff4pbtMe97GOqtvQ?pwd=hutb) 的“学习->大模型->webui”目录中的文件下载；
2. 解压`python.zip`到`webui/`目录，`WizardCoder-15B-1.0-GPTQ.zip`和`chatglm2-6b.zip`解压到`webui/models`目录下；
3. 运行`windowsdesktop-runtime-6.0.10-win-x64.exe`安装.Net；
4. 点击`快速启动.exe`运行图形化界面。


## 贡献指南
在进行代码之前，请阅读 [贡献指南](https://github.com/OpenHUTB/bazaar/blob/master/CONTRIBUTING.md) 文档。

##  参考
[WizardCoder](https://github.com/nlpxucan/WizardLM/tree/main/WizardCoder) 

[WebUI整合包视频](https://www.bilibili.com/video/BV1jj411S7YD)

[matlab 实现 GPT2](https://github.com/matlab-deep-learning/transformer-models)

[fauxpilot代码生成服务](https://github.com/fauxpilot/fauxpilot) 

[CodeGeeX2代码生成模型](https://github.com/THUDM/CodeGeeX2) 

[CodeGeezX多语言代码生成模型](https://github.com/THUDM/CodeGeeX) 

[Matlab和OpenAI进行通信的App](https://github.com/toshiakit/MatGPT)

[生成Python](https://github.com/microsoft/PyCodeGPT) 

