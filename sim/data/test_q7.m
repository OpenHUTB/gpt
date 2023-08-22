% 生成一段四车道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v = vehicle(scenario,'ClassID',1);
plot(scenario,'RoadCenters','on','Centerline','on');