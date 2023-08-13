%定义一条双车道缩减为单车道的道路和两辆车，车辆v1的初始位置为x=5,y=2,z=0，车辆v2的初始位置为x=15,y=-2,z=0，并固定v2的运动路线，长度为125m
scenario = drivingScenario;
roadCenters = [0 0; 125 0];
% 定义一个包含两个单行道路段的车道规格数组
%注意到第二个道路段中有一条车道被减少
lsArray = [lanespec(2) lanespec(1)];
%定义一个道路段连接器对象。指定要减少车道的位置和锥度长度
lc = laneSpecConnector('Position','Left','TaperLength',30);
%组合道路段的车道规格
clspec = compositeLaneSpec(lsArray,'Connector',lc);
road(scenario,roadCenters,'lanes',clspec);
%生成两辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
%车辆v1的初始位置为x=5,y=2,z=0
v1.Position = [5 2 0];
%车辆v2的初始位置为x=15,y=-2,z=0
v2.Position = [15 -2 0];
%规定小车运动轨迹
trajectory(v2,[0 -2; 50 -2]);
%使用drivingScenarioDesigner打开场景
drivingScenarioDesigner('Scenario', scenario);
