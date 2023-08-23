% 创建一个只有单个车道的双向道路，车道宽为默认值，车道线标记为双虚线
scenario = drivingScenario;
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1],"marking",[laneMarking('DoubleDashed')]);
road(scenario,roadCenters,'Lanes',laneSpecification);
plot(scenario)