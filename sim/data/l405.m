% 创建一个只有单个车道的双向道路，路长为70米，车道宽为5，初始车道转向角设置为四十五度，并在路上生成一辆车
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 70 1 0];
laneSpecification = lanespec([1 1],"width",[5 5]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
v1 = vehicle(scenario,"ClassID",1,"Position",[65 1 0]);
plot(scenario)