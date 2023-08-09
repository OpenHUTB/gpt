% 再加一条与第一条路相交成直角的路，形成T形
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);
roadCenters = [20.3 38.4 0; 20 3 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification)
plot(scenario)
