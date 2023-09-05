

# 运行

## 环境配置
经过测试的Python版本为 3.8，安装依赖包命令：
```shell
pip install -r requirements.txt
```
服务器地址：`C:\Anaconda\envs\padpkg\python.exe`。

## 运行步骤
1. 语音识别
```shell
python generateText.py data/create_scenario.wav
```
输出：`创建一个驾驶场景对象并在场景中创建一个车辆对象`。

2. 语音合成
```shell
python generateVoice.py 创建一个驾驶场景对象并在场景中创建一个车辆对象 data/output.wav
```
输出为文字的输出音频文件`output.wave`。


# 其他配置

## Docker 配置
1. [win10上配置Docker](https://blog.csdn.net/weixin_44649780/article/details/128335908) 。
参考[使用Docker在Linux服务器本地部署PaddleSpeech Web服务](https://blog.csdn.net/m0_65099796/article/details/131770806) 。

2. 启动容器：
```shell
docker run -t -d toolsmiths/ubuntu16.04-build:gpdb5-v192
```

## 构建镜像
查找有哪些镜像
```shell
docker search paddle
registry.baidubce.com/paddlepaddle/paddle
```
```shell
docker build -t baidu/speech:v1 .
```
网络异常错误：
```text
 dial tcp: lookup production.cloudflare.docker.com on 127.0.1.1:53: server misbehaving
```
解决办法：
```shell
vim /etc/resolv.conf
```
改成了8.8.8.8

## 调用
访问语音识别服务（位于`gpt\recognition\PaddleSpeech\paddlespeech\server\bin\paddlespeech_client.py`：
```shell
paddlespeech_client asr --server_ip 127.0.0.1 --port 8090 --input input_16k.wav
```
访问语音合成服务
```shell
paddlespeech_client tts --server_ip 127.0.0.1 --port 8090 --input "您好，欢迎使用百度飞桨语音合成服务。" --output output.wav
```




## 语音识别和合成配置
* Python >= 3.7
* C++ 编译环境
* Windows，Mac，Linux（推荐）
### 安装PaddleSpeech
部分用户系统由于默认源的问题，安装中会出现kaldiio安转出错的问题，建议首先安装pytest-runner:

`pip install pytest-runner -i https://pypi.tuna.tsinghua.edu.cn/simple `

安装PaddlePaddle

`pip install paddlepaddle==2.4.2 -i https://mirror.baidu.com/pypi/simple`

安装paddle speech

`pip install paddlespeech -i https://pypi.tuna.tsinghua.edu.cn/simple`

使用较低版本的numpy

`pip install numpy==1.21.6`

### 简单调用

#### 语音合成

命令行：`paddlespeech tts --input "输入你想要合成的语音文本" --output output.wav`

pythonAPI：

`from paddlespeech.cli.tts.infer import TTSExecutor`

`tts = TTSExecutor()`

 `tts(text="输入你想要合成的语音文本。", output="output.wav")`

#### 语音识别

命令行：`paddlespeech asr --lang zh --input 音频.wav`

pythonAPI：

`from paddlespeech.cli.asr.infer import ASRExecutor`

`asr = ASRExecutor()`

`result = asr(audio_file="音频.wav")`

`print(result)`
