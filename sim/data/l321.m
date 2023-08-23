% 创建含有两条双向车道的160米道路，车道宽为默认值，初始车道转向角设置为九十度，并在道路上生成一辆小车
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 160 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[90 0]);
v1 = vehicle(scenario,"ClassID",1,"Position",[155 -0.5 0]);
plot(scenario)