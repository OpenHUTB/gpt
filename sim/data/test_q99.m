% 生成一段1000m的三车道的路和三辆车，车分别在一二三车道上
scenario = drivingScenario;
roadCenters = [0 0; 1000 0];
road(scenario, roadCenters, 'Lanes', lanespec(3));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);
v3 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [0 4 0]; % 放置在第一条车道上
v3.Position = [0 -4 0]; % 放置在第三条车道上