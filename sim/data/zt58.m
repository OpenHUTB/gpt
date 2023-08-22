% 生成一段140m的三车道的道路和两辆车，车辆v1的位置是x=0,y=4,z=0
scenario = drivingScenario;
roadCenters = [0 0; 140 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v1 = vehicle(scenario,'ClassID',1);
v2 = vehicle(scenario,'ClassID',1);%创建第二辆小车
v1.Position = [0 4 0];%车辆v1的初始位置为x=0,y=4,z=0