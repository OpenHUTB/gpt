% 生成长62m的两车道和十辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 62 0];
road(scenario, roadCenters, 'lanes', lanespec(2));
% 添加十辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
v4 = vehicle(scenario,'ClassID',1);
v5 = vehicle(scenario,'ClassID',1);
v6 = vehicle(scenario,'ClassID',1);
v7 = vehicle(scenario,'ClassID',1);
v8 = vehicle(scenario,'ClassID',1);
v9 = vehicle(scenario,'ClassID',1);
v10 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
v2.Position = [1 2 0];
v3.Position = [8 2 0];
v4.Position = [8 -2 0];
v5.Position = [15 2 0];
v6.Position = [15 -2 0];
v7.Position = [22 2 0];
v8.Position = [22 -2 0];
v9.Position = [29 2 0];
v10.Position = [29 -2 0];
% 展示场景
plot(scenario,'RoadCenters','on');