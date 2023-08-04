% 生成一段四车道路和两辆车，且第二辆车速度比第一辆慢
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario, roadCenters, 'Lanes', lanespec(4));

v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);

% 调整第二辆车的初始位置
v2.Position = [10 2 0]; % 根据需要调整位置坐标

% 设置车辆初始速度
v1.Velocity = 20; % 第一辆车的初始速度
v2.Velocity = 25; % 第二辆车的初始速度