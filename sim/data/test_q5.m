% 生成一段三车道的路和两辆车，车分别在一二车道上
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario, roadCenters, 'Lanes', lanespec(3));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [0 4 0]; % 将x坐标设置为负数，放置在第一条车道上