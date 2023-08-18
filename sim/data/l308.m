% 创建含有两条双向车道的100米道路，车道宽为默认值，初始车道转向角设置为九十度
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 100 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[90 0]);
plot(scenario)