% 生成一段600m两车道路和八辆车，模拟一个堵车的场景
scenario = drivingScenario;
roadCenters = [0 0; 600 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
v4 = vehicle(scenario,'ClassID',1);
v5 = vehicle(scenario,'ClassID',1);
v6 = vehicle(scenario,'ClassID',1);
v7 = vehicle(scenario,'ClassID',1);
v8 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [1 -2 0]; % 根据需要调整位置坐标
v2.Position = [6 -2 0];
v3.Position = [12 -2 0];
v4.Position = [18 -2 0];
v5.Position = [1 2 0]; 
v6.Position = [6 2 0];
v7.Position = [12 2 0];
v8.Position = [18 2 0];