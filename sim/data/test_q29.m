% 生成一段200m的四车道路和两辆车
scenario = drivingScenario;
roadCenters = [0 0; 200 0];
road(scenario, roadCenters, 'Lanes', lanespec(4));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [10 2 0]; % 根据需要调整位置坐标