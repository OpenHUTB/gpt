% 创建含有三条单向车道的道路，车道宽为5.9，初始车道转向角设置为四十五度，并在路上生成一辆车
scenario = drivingScenario("SampleTime",0.5);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[5.9 5.9 5.9]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
v1 = vehicle(scenario,"ClassID",1,"Position",[49 1 0]);
plot(scenario)