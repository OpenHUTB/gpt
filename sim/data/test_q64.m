% 生成一段600m的四车道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 600 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v = vehicle(scenario,'ClassID',1);