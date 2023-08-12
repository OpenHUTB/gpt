% 生成一段s型曲线道路和一辆车
scenario = drivingScenario;
roadCenters = [ 0    0 0;
                  20  20 0;
                  40 -20 0;
                  60  20 0;
                  80 -20 0;
                 100   0 0 ];%一段s型曲线道路
road(scenario,roadCenters,'Lanes',lanespec(3));
v = vehicle(scenario,'ClassID',1);