% 生成一个缓弯路段,总共5辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-49.5,-2.03,0) (-31.36,-1.89,0) (-22.2,-1.9,0) ,卡车坐标是(-13.7,-1.88,0) 
scenario = drivingScenario;
roadCenters = [-2.9 0.1 0;
    6 0 0;
    23.6 -2.8 0;
    38.4 -8.8 0;
    45.8 -13.5 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [-60 0 0;
    1 0 0];
laneSpecification = lanespec([1 1]);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');
%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 -1.89 0]);
vehicle(scenario,'ClassID', 1,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-13.7 -1.88 0]);