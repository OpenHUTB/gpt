% 生成一个五口路口,总共11辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-49.5,1.97,0) (-49.5,-2.03,0) (-40.5,-1.96,0) (-31.36,-1.89,0) (-22.2,1.9,0) (-22.2,-1.9,0) (-13.7,-1.88,0) (-4.75,-1.85,0) ,卡车坐标是(-40.5,1.87,0) (-31.36,1.86,0) 
scenario = drivingScenario;
roadCenters = [0 0 0;
    30 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [41.9 1.9 0;
    64.6 10.2 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [36.25 4.65 0;
    33 34.3 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [56.5 -31.1 0;
    42.2 -5.4 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [23.7 -35 0;
    34.5 -5.1 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [42.8 2.2 0;
    37.1 0.5 0;
    29.9 0 0];
roadWidth = 7.35;
road(scenario, roadCenters, roadWidth, 'Name', 'Road');

roadCenters = [42.7 2.3 0;
    37.4 2.6 0;
    36.4 5.4 0];
roadWidth = 7.35;
road(scenario, roadCenters, roadWidth, 'Name', 'Road1');

roadCenters = [42.3 -5.5 0;
    41.5 -3.9 0;
    41.8 1.9 0];
roadWidth = 7.35;
road(scenario, roadCenters, roadWidth, 'Name', 'Road2');

roadCenters = [42.9 2.2 0;
    36.7 -1.8 0;
    34.3 -6.3 0];
roadWidth = 7.35;
road(scenario, roadCenters, roadWidth, 'Name', 'Road3');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-40.5 1.87 0]);
vehicle(scenario,'ClassID', 1,'Position', [-40.5 -1.96 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 -1.89 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-13.7 -1.88 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 -1.85 0]);