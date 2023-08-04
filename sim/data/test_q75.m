% 生成一段600m的四车道路和四辆车且四辆车在第四条车道上，模拟一个堵车的场景
scenario = drivingScenario;
roadCenters = [0 0; 600 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
v4 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [1 -5 0]; % 根据需要调整位置坐标
v2.Position = [6 -5 0];
v3.Position = [12 -5 0];
v4.Position = [18 -5 0];