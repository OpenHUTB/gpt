% 生成一段1000m的路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 1000 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
v = vehicle(scenario,'ClassID',1);