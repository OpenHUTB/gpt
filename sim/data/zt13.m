% 生成一段三车道的道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);
v1.Position = [0 4 0];%车辆v1的初始位置为x=0,y=4,z=0
v2.Position = [0 -4 0];%车辆v2的初始位置为x=0,y=-4,z=0
plot(scenario,'RoadCenters','on','Centerline','on');