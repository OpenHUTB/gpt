% 生成一个中间有掉头口的路段,总共11辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-40.5,1.87,0) (-40.5,-1.96,0) (-31.36,1.86,0) (-31.36,-1.89,0) ,卡车坐标是(-49.5,1.97,0) (-49.5,-2.03,0) (-22.2,1.9,0) (-22.2,-1.9,0) (-13.7,-1.88,0) (-4.75,-1.85,0) 
scenario = drivingScenario;
roadCenters = [20.6 20.5 0;
    39.5 10.1 0;
    20.4 -8.8817841970013e-16 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [0 0 0;
    59.97 -0.0099999999999998 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [0 20.35 0;
    60.05 20.35 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-49.5 1.97 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 1,'Position', [-40.5 1.87 0]);
vehicle(scenario,'ClassID', 1,'Position', [-40.5 -1.96 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 -1.89 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 -1.88 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-4.75 -1.85 0]);