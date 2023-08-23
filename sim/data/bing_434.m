% 生成一个有急弯路段的高速公路,总共8辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-40.5,-1.96,0) (-22.2,-1.9,0) (-13.7,1.7,0) ,卡车坐标是(-58.5,2.1,0) (-49.5,1.97,0) (-31.36,1.86,0) (-4.75,1.83,0) 
scenario = drivingScenario;
roadCenters = [-2.6 0 0;
    6 0 0;
    17.2 -5.3 0;
    16.1 -12 0;
    7.6 -18.9 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

barrierCenters = [-59.7 0.3 0;
    6.3 0.3 0;
    11.4 -0.2 0;
    15.8 -2.8 0;
    17.8 -6.8 0;
    16.1 -12.1 0;
    12.6 -16.2 0;
    8.2 -18.9 0];
barrier(scenario, barrierCenters, ...
    'ClassID', 5, ...
    'Width', 0.61, ...
    'Height', 0.81, ...
    'Mesh', driving.scenario.jerseyBarrierMesh, 'PlotColor', [0.65 0.65 0.65], 'Name', 'Jersey Barrier');

%生成汽车
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-58.5 2.1 0]);
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 1,'Position', [-40.5 -1.96 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-13.7 1.7 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-4.75 1.83 0]);