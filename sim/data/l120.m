% 创建含有三条单向车道的道路，车道宽为5.1
scenario = drivingScenario("SampleTime",0.5);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[5.1 5.1 5.1]);
road(scenario,roadCenters,'Lanes',laneSpecification);
plot(scenario)