% 生成一段400m的路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 400 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
v = vehicle(scenario,'ClassID',1);