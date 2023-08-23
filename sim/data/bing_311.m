% 生成一段三车道,总共6辆轿车和卡车,轿车坐标是(-49.5,1.97,0) (-4.75,1.83,0) ,卡车坐标是(-58.5,2.1,0) (-58.5,-2,0) (-22.2,1.9,0) (-13.7,1.7,0) 
scenario = drivingScenario;
roadCenters = [0 0 0;
    30 0 0];
laneSpecification = lanespec([3 3]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([3 3]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');
%生成汽车
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-58.5 2.1 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 1.7 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 1.83 0]);