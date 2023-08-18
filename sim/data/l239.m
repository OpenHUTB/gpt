% 创建含有两条单向车道的道路，车道宽为55，车道线标记为虚线，虚线间隙长度设置为3,车道宽为6，并在路上随机位置生成两辆车
scenario = drivingScenario;
roadCenters = [0 1 0; 55 1 0];
laneSpecification = lanespec([1 1],"marking",[laneMarking('Dashed','Space',3)],"width",[6 6]);
road(scenario,roadCenters,'Lanes',laneSpecification);
v1 = vehicle(scenario,"ClassID",1,"Position",[30 -2 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[5 4 0]);
plot(scenario)