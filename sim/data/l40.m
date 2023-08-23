% 创建含有两条单向车道的道路，车道宽为55，车道线标记为虚线，虚线间隙长度设置为3,车道宽为6
scenario = drivingScenario;
roadCenters = [0 1 0; 55 1 0];
laneSpecification = lanespec([1 1],"marking",[laneMarking('Dashed','Space',3)],"width",[6 6]);
road(scenario,roadCenters,'Lanes',laneSpecification);
plot(scenario)