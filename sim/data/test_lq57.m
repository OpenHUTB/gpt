% 生成一条125m的单行道和一辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 125 0];
road(scenario, roadCenters, 'lanes', lanespec(1));
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 展示场景
plot(scenario,'RoadCenters','on');