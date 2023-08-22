%定义一条分岔路口和两辆车，直线路段为三车道，长度为110m,车辆v1的初始位置为x=10,y=2,z=0,车辆v2的初始位置为x=15,y=-3;z=0
scenario = drivingScenario;

ls = lanespec(2);
laneWidth = ls.Width(1);

% 添加直线道路段
road(scenario, [0 0 0; 110 0 0], 'lanes', lanespec(3));

% 定义车道出口的航点
roadCenters =  [3.0 -laneWidth/2
                3.1 -laneWidth/2
               15.0 -laneWidth
               45.0 -20];

% 增加出口车道
road(scenario, roadCenters, laneWidth);

v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);%创建第二辆小车
% 调整车辆的初始位置
v1.Position = [10 2 0];%车辆v1的初始位置为x=10,y=2,z=0
v2.Position = [15 -3 0];%车辆v2的初始位置为x=15,y=-3;z=0

% 使用drivingScenarioDesigner打开场景
drivingScenarioDesigner('Scenario', scenario);