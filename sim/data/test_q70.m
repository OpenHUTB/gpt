% 生成一段600m的三车道路和三辆车且三辆车在中间车道上
scenario = drivingScenario;
roadCenters = [0 0; 600 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [1 0 0]; % 根据需要调整位置坐标
v2.Position = [10 0 0];
v3.Position = [20 0 0];