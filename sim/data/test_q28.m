% 生成一段200m的四车道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 200 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
v = vehicle(scenario,'ClassID',1);