% 生成一个环岛路口,总共11辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-49.5,1.97,0) (-49.5,-2.03,0) (-31.36,-1.89,0) (-22.2,-1.9,0) (-13.7,-1.88,0) (-4.75,1.83,0) ,卡车坐标是(-40.5,1.87,0) (-31.36,1.86,0) (-22.2,1.9,0) (-13.7,1.7,0) 
scenario = drivingScenario;
roadCenters = [16 -0.5 0;
    38.3 -0.4 0;
    16 -0.5 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [16.1 -0.5 0;
    -11.9 -0.5 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [66.15 -0.45 0;
    38.15 -0.45 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [26.3 -11.8 0;
    26.2 -39.1 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [26.95 38.25 0;
    26.85 10.95 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');
%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-40.5 1.87 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 -1.89 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 1.7 0]);
vehicle(scenario,'ClassID', 1,'Position', [-13.7 -1.88 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 1.83 0]);