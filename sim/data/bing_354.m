% 生成一段单向车道,总共3辆轿车和卡车,轿车坐标是(-32.7,0.0,0) ,卡车坐标是(-15.27,0.1,0) (-6.4,0.1,0) 
scenario = drivingScenario;
roadCenters = [0 0 0;
    30 0 0];
laneSpecification = lanespec(1);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec(1);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');
%生成汽车
egoVehicle = vehicle(scenario,'ClassID', 1,'Position', [-32.7 0.0 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-15.27 0.1 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-6.4 0.1 0]);