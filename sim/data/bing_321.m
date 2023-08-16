% 生成一段四车道,总共7辆轿车和卡车,轿车坐标是(-58.5,-2,0) (-49.5,-2.03,0) (-31.36,1.86,0) (-13.7,1.7,0) (-4.75,-1.85,0) ,卡车坐标是(-22.2,1.9,0) (-22.2,-1.9,0) 
scenario = drivingScenario;
roadCenters = [0 0 0; 30 0 0];
road(scenario, roadCenters, 'Lanes', lanespec([4 4]), 'Name', 'Road');

roadCenters = [-60 0 0; 1 0 0];
road(scenario, roadCenters, 'Lanes', lanespec([4 4]), 'Name', 'Road');
%生成汽车
vehicle(scenario,'ClassID', 1,'Position', [-58.5 -2 0]);
vehicle(scenario,'ClassID', 1,'Position', [-49.5 -2.03 0]);
vehicle(scenario,'ClassID', 1,'Position', [-31.36 1.86 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 1.9 0]);
vehicle(scenario,'ClassID', 2,'Height', 3.5,'Position', [-22.2 -1.9 0]);
vehicle(scenario,'ClassID', 1,'Position', [-13.7 1.7 0]);
vehicle(scenario,'ClassID', 1,'Position', [-4.75 -1.85 0]);