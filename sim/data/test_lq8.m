% 生成一条向左边弯曲的道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 20 0; 40 25];
roadWidth = 6;
road(scenario, roadCenters, roadWidth,'lanes',lanespec(2));
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 展示场景
plot(scenario,'RoadCenters','on');