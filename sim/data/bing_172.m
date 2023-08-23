% 生成一段两连弯的连续弯路,总共8辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-4.75,1.83,0) (-4.75,-1.85,0) ,卡车坐标是(-58.5,2.1,0) (-31.36,1.86,0) (-31.36,-1.89,0) (-22.2,1.9,0) (-22.2,-1.9,0) 
scenario = drivingScenario;
roadCenters = [-3.1086244689504e-15 7.7715611723761e-16 0;
    12 -0.3 0;
    34.7 6.6 0;
    37.7 33 0;
    61.3 43.9 0;
    84.5 43.1 0;
    94.8 43.1 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');
%生成汽车
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-58.5 2.1 0]);
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-31.36 -1.89 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 1.83 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 -1.85 0]);