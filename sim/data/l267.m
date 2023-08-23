% 在s形道路上划分三车道,三个车道上都创建一辆小车,规定它沿着路行驶,三维显示小车运动轨迹
scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
ls = lanespec(3);
road(scenario,roadcenters,'Lanes',ls);
car = vehicle(scenario, ...
    'ClassID',1, ...
    'Position',[-35 20 0]);
car2 = vehicle(scenario, ...
    'ClassID',1, ...
    'Position',[-31.3 19.1 0]);
car3 = vehicle(scenario, ...
    'ClassID',1, ...
    'Position',[-39 21 0]);
waypoints = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
waypoints2 = [-31.3 19.1 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
waypoints3 = [-39 21 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
smoothTrajectory(car,waypoints);
smoothTrajectory(car2,waypoints2);
smoothTrajectory(car3,waypoints3);
plot(scenario)
chasePlot(car)