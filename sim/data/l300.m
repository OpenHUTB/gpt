% 创建含有两条双向车道的60米道路，车道宽为默认值，初始车到转向角设置为九十度
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 60 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[90 0]);
plot(scenario)