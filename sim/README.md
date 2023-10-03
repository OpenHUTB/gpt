# 驾驶场景显示

## 运行
1. 启动虚幻引擎可执行文件中的脚本
2. 运行以下命令，参数使用本地虚幻引擎的可执行文件代替：
```
main('C:\Buffer\gpt\WindowsNoEditor\AutoVrtlEnv.exe')
```

## 流程
1. 获得生成的matlab代码
2. 使用驾驶场景设计器打开场景变量
```shell
drivingScenarioDesigner(scenario)
```
3. 打开虚幻引擎
4. 启动仿真


## 仿真软件
配置[自定义仿真软件](https://github.com/OpenHUTB/matlab) 。

## 虚幻引擎转发配置
从[网盘链接](https://pan.baidu.com/s/1n2fJvWff4pbtMe97GOqtvQ?pwd=hutb) `虚幻引擎`目录中下载`WindowsNoEditor_EmptyGrass4k4k.zip`并解压（使用该文件，后面一步不需要配置，直接跳到`启动`步骤。

参考[链接](https://docs.unrealengine.com/4.26/zh-CN/SharingAndReleasing/PixelStreaming/PixelStreamingIntro/) 进行虚幻引擎像素流插件的配置，碰到`
Streamer disconnected`或者`浏览器访问时的Crash`问题请参考[链接](https://blog.csdn.net/m0_55173487/article/details/126231595) ，相应改动代码位于`WindowsNoEditor\Engine\Source\Programs\PixelStreaming\WebServers\SignallingWebServer`目录下。


### 启动
启动信令服务，接受前端发送过来的命令，并将命令转发到ue4服务端，同时接受ue4服务端发送过来的视频流与其他信息转发给前端：
```shell
WindowsNoEditor\Engine\Source\Programs\PixelStreaming\WebServers\SignallingWebServer\run.bat
```

启动三维场景仿真（注意，从仿真软件中启动场景时已经执行了下面命令，故不再需要执行）：
```shell
WindowsNoEditor/RoadProject.exe - 快捷方式
D:\buffer\hutb_scenario\WindowsNoEditor\RoadProject.exe -AudioMixer -PixelStreamingIP=localhost -PixelStreamingPort=8888
```

增加运行场景的参数：
```shell
matlab\toolbox\shared\sim3d\sim3d\+sim3d\World.m -> asCommand(self)
```

## 将 simulink 模型导出为.m脚本


## 驾驶场景设计器分析



### 虚幻引擎调用关系
toolbox\shared\drivingscenario\drivingScenarioDesigner.m -> 

toolbox\shared\drivingscenario\+driving\+internal\+scenarioApp\Designer.m

toolbox\shared\drivingscenario\+driving\+internal\+scenarioApp\GamingEngineScenarioViewer.m -> GamingEngineScenarioViewer(hApp, varargin) -> setup(this) 启动虚幻引擎

setup(this)  -> setup(animator)



toolbox\shared\drivingscenario\+driving\+scenario\+internal\GamingEngineScenarioAnimator.m -> setup(this) -> 

this.setupCommandReaderAndWriter();  % 打开虚幻引擎黑色界面（无内容）
->
World = sim3d.World(sim3d.engine.Env.AutomotiveExe(), "/Game/Maps/EmptyGrass4k4k");  -> sim3d.engine.Env.AutomotiveExe()
World.start();  % 打开虚幻引擎（黑色）界面

toolbox\shared\sim3d\sim3d\+sim3d\+engine\Env.m 


### C++接口
C++和虚幻引擎进行交互的接口所在目录
```text
matlab\SupportPackages\toolbox\shared\sim3dprojects\spkg\plugins\mw_simulation\MathWorksSimulation\Source\MathWorksSimulation\Public\Sim3dActor.h
```

### 库文件
`UE4Editor-MathWorksSimulation.dll`和`UE4Editor-MathWorksSimulation.pdb`文件所在的目录
```text
matlab\SupportPackages\toolbox\shared\sim3dprojects\spkg\plugins\mw_simulation\MathWorksSimulation\Binaries\Win64
```
dll文件是运行时需要调用的动态链接库，为函数可执行的代码文件。

pdb为程序数据二进制文件，pdb文件保存着调试和项目状态信息，包含了编译后程序指向源代码的位置信息，用于调试的时候定位到源代码，主要是用来方便调试的。release后建议删掉，有利于保护程序。
.pdb 文件包含指向源代码存储库的指针，以及用于从该存储库检索源代码的命令。

使用vs2019打开后，有两个工程`Engine/UE4`和`Games/AutoVrtEnv`。

### 虚幻引擎
调用的虚幻引擎代码位于：
```text
UE_4.26\Engine\Source\Developer\MaterialUtilities\Private\MaterialUtilities.cpp
```

## 问题
```未找到具有匹配签名的方法 ':all:'。```
原因：存在和matlab同名的类或者方法。

[UE4像素流pixelstream的一些坑](https://blog.csdn.net/MAPLE_HY/article/details/112599840)

[android在局域网连接PixelStreaming 失败](https://blog.csdn.net/maxiaosheng521/article/details/106215330)
