% 在s形道路上划分三车道,车道线为默认值（白色虚线）
scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
ls = lanespec(3);
road(scenario,roadcenters,'Lanes',ls);
plot(scenario)