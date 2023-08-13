% 生成一个长71m的X字路口和一辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 71 0];
road(scenario, roadCenters, 'lanes', lanespec([1,1]));
roadCenters = [50 -50; 25  50];
road(scenario, roadCenters, 'lanes', lanespec([1 1]));
% 添加一辆车
v1 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
% 展示场景
plot(scenario,'RoadCenters','on');