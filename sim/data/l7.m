% 创建一个有s型弯道的道路的驾驶场景

scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
road(scenario,roadcenters)
plot(scenario)

