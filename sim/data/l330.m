% 创建含有三条单向车道的道路，车道宽为4.5，初始车道转向角设置为九十度
scenario = drivingScenario("SampleTime",0.5);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[4.5 4.5 4.5]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
plot(scenario)