% 生成四车道长86m的路和两辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 86 0];
road(scenario, roadCenters, 'lanes', lanespec(4));
% 添加一辆车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 1.5 0];
v2.Position = [1 5.5 0];
% 展示场景
plot(scenario,'RoadCenters','on');