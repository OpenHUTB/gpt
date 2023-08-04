% 生成一段200m的四车道路和三辆车且三辆车在第二条车道上
scenario = drivingScenario;
roadCenters = [0 0; 200 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [1 2 0]; % 根据需要调整位置坐标
v2.Position = [10 2 0];