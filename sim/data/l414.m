% 创建一个只有单个车道的双向道路，车道宽为默认值，车道线标记为虚线，虚线间隙长度设置为2，初始车道转向角设置为四十五度
scenario = drivingScenario;
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1],"marking",[laneMarking('Dashed','Space',2)]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
plot(scenario)