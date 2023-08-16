% 生成一段单行线,总共3辆轿车和卡车,轿车坐标是(-32.7,0.0,0) (-6.4,0.1,0) ,卡车坐标是(-24.03,0.1,0) 
scenario = drivingScenario;
roadCenters = [0 0 0; 30 0 0];
road(scenario, roadCenters, 'Lanes', lanespec(1));
roadCenters = [-60 0 0; 1 0 0];
road(scenario, roadCenters, 'Lanes', lanespec(1));
%生成汽车
egoVehicle = vehicle(scenario,'ClassID', 1,'Position', [-32.7 0.0 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-24.03 0.1 0]);
vehicle(scenario,'ClassID', 1,'Position', [-6.4 0.1 0]);