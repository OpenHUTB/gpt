% 创建含有两条单向车道的道路，车道宽为默认值，并在路上随机位置生成两辆车
scenario = drivingScenario("SampleTime",0.5);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification);
v1 = vehicle(scenario,"ClassID",1,"Position",[3 -1 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[25 3 0]);
plot(scenario)