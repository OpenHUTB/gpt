% 生成一段60m的三车道的道路和两辆车,车辆v1的初始位置为x=0,y=4,z=0,车辆v2的初始位置为x=10,y=-4;z=0
scenario = drivingScenario;
roadCenters = [0 0; 60 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);%创建第二辆小车
% 调整车辆的初始位置
v1.Position = [0 4 0];%车辆v1的初始位置为x=0,y=4,z=0
v2.Position = [10 -4 0];%车辆v2的初始位置为x=10,y=-4;z=0