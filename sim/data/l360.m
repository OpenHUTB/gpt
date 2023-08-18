% 创建含有两条单向车道的道路，车道宽为默认值，车道线标记为虚线，虚线间隙长度设置为1.6，初始车道转向角设置为四十五度
scenario = drivingScenario;
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(2,"marking",[laneMarking('Dashed','Space',1.6)]);
road(scenario,roadCenters,'Lanes',laneSpecification,'Heading',[45 0]);
plot(scenario)