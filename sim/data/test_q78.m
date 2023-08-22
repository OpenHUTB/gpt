% 生成一段800m的路和两辆车，且第二辆车在第一辆车后面
scenario = drivingScenario;
roadCenters = [0 0; 800 0];
road(scenario, roadCenters, 'Lanes', lanespec(2));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [-2 2 0]; % 根据需要调整位置坐标