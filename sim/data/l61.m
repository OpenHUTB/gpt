% 在s形道路上划分三车道,车道线为白色实线
scenario = drivingScenario('StopTime',3);
roadcenters = [-35 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
lm = [laneMarking('Solid','Color','w'); ...
    laneMarking('Solid','Color','w'); ...
    laneMarking('Solid','Color','w'); ...
    laneMarking('Solid','Color','w')];
ls = lanespec(3,'Marking',lm);
road(scenario,roadcenters,'Lanes',ls);
plot(scenario)