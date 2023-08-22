% 在s形道路上划分四车道，且为双向道，左边两条，右边两条
scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
ls = lanespec([2 2]);
road(scenario,roadcenters,'Lanes',ls);
plot(scenario)