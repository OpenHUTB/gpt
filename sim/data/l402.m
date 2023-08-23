% 创建一个只有单个车道的双向道路，路长为80米，车道宽为4，初始车道转向角设置为四十五度
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 80 1 0];
laneSpecification = lanespec([1 1],"width",[4 4]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
plot(scenario)