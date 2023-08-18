% 创建一个只有单个车道的双向道路，路长为80米，车道宽为默认值，初始车道转向角设置为四十五度
scenario = drivingScenario;
roadCenters = [0 1 0; 80 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
plot(scenario)