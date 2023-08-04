% 生成一段400m的三车道的路和两辆车
scenario = drivingScenario;
roadCenters = [0 0; 400 0];
road(scenario, roadCenters, 'Lanes', lanespec(3));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [10 2 0]; % 根据需要调整位置坐标