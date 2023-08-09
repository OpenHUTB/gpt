% 在场景中添加一条双向车道道路，左侧一条，右侧一条

scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);
plot(scenario)

