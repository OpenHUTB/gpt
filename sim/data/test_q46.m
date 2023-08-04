% 生成一段400m的四车道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 400 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v = vehicle(scenario,'ClassID',1);