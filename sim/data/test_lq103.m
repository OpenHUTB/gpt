% 生成一条向右边弯曲的道路长65m和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 15 0; 65 -15];
roadWidth = 6;
road(scenario, roadCenters, roadWidth,'lanes',lanespec(2));
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 展示场景
plot(scenario,'RoadCenters','on');