% 生成一段三车道的100m道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 100 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v = vehicle(scenario,'ClassID',1);