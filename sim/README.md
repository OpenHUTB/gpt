# 驾驶场景显示

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


