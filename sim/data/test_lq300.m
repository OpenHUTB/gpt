% 生成长69m的两车道和四辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 69 0];
road(scenario, roadCenters, 'lanes', lanespec(2));
% 添加四辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
v4 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
v2.Position = [1 2 0];
v3.Position = [8 2 0];
v4.Position = [8 -2 0];
% 展示场景
plot(scenario,'RoadCenters','on');