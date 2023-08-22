% 生成一段三车道路和三辆车且三辆车同一水平位置
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [0 3 0]; % 根据需要调整位置坐标
v2.Position = [0 0 0];
v3.Position = [0 -3 0];