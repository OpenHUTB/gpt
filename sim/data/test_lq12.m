% 生成三车道的路和一辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 55 0];
road(scenario, roadCenters, 'lanes', lanespec(3));
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v.Position = [1 -4 0];
% 展示场景
plot(scenario,'RoadCenters','on');