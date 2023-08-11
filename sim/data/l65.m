% 在s形道路上划分三车道,中间车道上创建一辆小车
scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
ls = lanespec(3);
road(scenario,roadcenters,'Lanes',ls);
car = vehicle(scenario, ...
    'ClassID',1, ...
    'Position',[-35 20 0]);
plot(scenario)