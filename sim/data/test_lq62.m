% 生成一个109m的十字路口和一辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 109 0];
road(scenario, roadCenters, 'lanes', lanespec([1,1]));
roadCenters = [25 -25; 25  25];
road(scenario, roadCenters, 'lanes', lanespec([1 1]));
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 展示场景
plot(scenario,'RoadCenters','on');