% 生成一段200m段两车道路和三辆车，三辆不在一列上
scenario = drivingScenario;
roadCenters = [0 0; 200 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);

% 调整车辆的初始位置
v1.Position = [1 1 0]; % 根据需要调整位置坐标
v2.Position = [10 -1 0];
v3.Position = [20 2 0];