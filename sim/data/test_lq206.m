% 生成三车道长96m的路和三辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 96 0];
road(scenario, roadCenters, 'lanes', lanespec(3));
% 添加两辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 0 0];
v2.Position = [1 4 0];
v3.Position = [1 -4 0];
% 展示场景
plot(scenario,'RoadCenters','on');