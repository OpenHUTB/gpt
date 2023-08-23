% 生成一段有二合一的路的高速公路,总共11辆轿车和卡车,轿车坐标是(-58.5,2.1,0) (-49.5,-2.03,0) (-40.5,-1.96,0) (-22.2,1.9,0) (-22.2,-1.9,0) (-4.75,-1.85,0) ,卡车坐标是(-58.5,-2,0) (-49.5,1.97,0) (-40.5,1.87,0) (-13.7,1.7,0) (-13.7,-1.88,0) 
scenario = drivingScenario;
roadCenters = [36.8 0 0;
    2.1 -15.3 0];
laneSpecification = lanespec(1);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [0 0 0;
    60 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

barrierCenters = [60.2 0.2 0;
    -59.6 0.2 0];
barrier(scenario, barrierCenters, ...
    'ClassID', 5, ...
    'Width', 0.61, ...
    'Height', 0.81, ...
    'Mesh', driving.scenario.jerseyBarrierMesh, 'PlotColor', [0.65 0.65 0.65], 'Name', 'Jersey Barrier');
%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 2.1 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-40.5 1.87 0]);
vehicle(scenario,'ClassID', 1,'Position', [-40.5 -1.96 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 1.7 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 -1.88 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 -1.85 0]);