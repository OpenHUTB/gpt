%定义一条分岔路口和两辆车，直线路段为三车道，车辆v1的初始位置为x=5,y=2,z=0，车辆v2的初始位置为x=15,y=-2,z=0，并固定v2的运动路线，长度为155m
scenario = drivingScenario;
ls = lanespec(2);
laneWidth = ls.Width(1);
% 添加直线道路段
road(scenario, [0 0 0; 155 0 0], 'lanes', lanespec(3));
% 定义车道出口的航点
roadCenters =  [3.0 -laneWidth/2
                3.1 -laneWidth/2
               15.0 -laneWidth
              45.0 -20];
% 增加出口车道
road(scenario, roadCenters, laneWidth);
%生成两辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
%车辆v1的初始位置为x=5,y=2,z=0
v1.Position = [5 2 0];
%车辆v2的初始位置为x=15,y=-2,z=0
v2.Position = [15 -2 0];
trajectory(v2,[0 -2; 50 -2]);
