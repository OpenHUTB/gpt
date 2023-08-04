% 生成交叉路口
scenario = drivingScenario;
roadCenters = [0 0; 50 0];
road(scenario, roadCenters, "lanes", lanespec([1 2]));
roadCenters = [25 -25; 25  25];
road(scenario, roadCenters, "lanes", lanespec([1 1]));
