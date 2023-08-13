% 生成一个长89m的十字路口和三辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 89 0];
road(scenario, roadCenters, 'lanes', lanespec([1,1]));
roadCenters = [25 -50; 25  50];
road(scenario, roadCenters, 'lanes', lanespec([1 1]));
% 添加车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
v2.Position = [1 2 0];
v3.Position = [25 45 0];
v3.Yaw = 90;  % 旋转车辆角度
% 展示场景
plot(scenario,'RoadCenters','on');