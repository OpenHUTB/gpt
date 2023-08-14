% 创建一个有 S 形弯道的驾驶场景,中心点分别为(-27 20 0),(-20 -20 0),(0 0 0),(20 20 0),(35 -20 0)
scenario = drivingScenario('StopTime',3);
roadcenters = [-27 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
% 创建车道并将其添加到道路上
lm = [laneMarking('Solid','Color','w'); ...
    laneMarking('Dashed','Color','y'); ...
    laneMarking('Dashed','Color','y'); ...
    laneMarking('Solid','Color','w')];
ls = lanespec(3,'Marking',lm);
road(scenario,roadcenters,'Lanes',ls);

plot(scenario)