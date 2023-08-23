% 创建含有三条单向车道的道路，车道宽为5.8
scenario = drivingScenario("SampleTime",0.5);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[5.8 5.8 5.8]);
road(scenario,roadCenters,'Lanes',laneSpecification);
plot(scenario)