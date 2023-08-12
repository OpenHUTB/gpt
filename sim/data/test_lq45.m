% 生成一个十字路口和五辆车
% 生成道路场景
scenario = drivingScenario;
roadCenters = [0 0; 100 0];
road(scenario, roadCenters, 'lanes', lanespec([1,1]));
roadCenters = [25 -50; 25  50];
road(scenario, roadCenters, 'lanes', lanespec([1 1]));
% 添加车
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v3 = vehicle(scenario,'ClassID',1);
v4 = vehicle(scenario,'ClassID',1);
v5 = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v1.Position = [1 -2 0];
v2.Position = [1 2 0];
v3.Position = [27 45 0];
v4.Position = [23 45 0];
v5.Position = [23 0 0];
v3.Yaw = 90;  % 旋转车辆角度
v4.Yaw = 90;
v5.Yaw = 90;
% 展示场景
plot(scenario,'RoadCenters','on');