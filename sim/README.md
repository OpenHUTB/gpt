# 驾驶场景显示

## 流程
1. 获得生成的matlab代码
2. 使用驾驶场景设计器打开场景变量
```shell
drivingScenarioDesigner(scenario)
```
3. 打开虚幻引擎
4. 启动仿真

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


