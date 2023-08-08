% 再加一条与第一条路相交成直角的路，形成T形
roadCenters = [20.3 38.4 0; 20 3 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification)