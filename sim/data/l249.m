% 创建含有两条单向车道的道路，车道宽为默认值，车道线标记为实线,实线宽度为0.7，并在路上随机位置生成两辆车,和一个行人
scenario = drivingScenario;
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(2,"marking",[laneMarking('Solid','Width',0.7)]);
road(scenario,roadCenters,'Lanes',laneSpecification);
v1 = vehicle(scenario,"ClassID",1,"Position",[30 -1 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[5 3 0]);
actor(scenario,'ClassID',4,'Length',0.2,'Width',0.4,'Height',1.7,'Position',[]);
plot(scenario)