% 生成一个X字路口和两辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 100 0];
road(scenario, roadCenters, 'lanes', lanespec([1,1]));
roadCenters = [80 -50; 5  50];
road(scenario, roadCenters, 'lanes', lanespec([1 1]));
% 添加车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
v2.Position = [1 2 0];
% 展示场景
plot(scenario,'RoadCenters','on');