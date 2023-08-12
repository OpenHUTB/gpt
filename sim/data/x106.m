% 创建一个有 S 形弯道的驾驶场景,中心点分别为(-30 20 0),(-20 -20 0),(0 0 0),(20 20 0),(35 -20 0)
scenario = drivingScenario('StopTime',3);
roadcenters = [-30 20 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
% 创建车道并将其添加到道路上
lm = [laneMarking('Solid','Color','w'); ...
    laneMarking('Dashed','Color','y'); ...
    laneMarking('Dashed','Color','y'); ...
    laneMarking('Solid','Color','w')];
ls = lanespec(3,'Marking',lm);
road(scenario,roadcenters,'Lanes',ls);
% 添加一个自我车辆，并根据其航点指定其轨迹。默认情况下，汽车以每秒 30 米的速度行驶
car = vehicle(scenario, ...
    'ClassID',1, ...
    'Position',[-35 20 0]);
% 汽车坐标为(-35 15 0),(-20 -20 0),(0 0 0),(20 20 0),(35 -20 0)
waypoints = [-35 15 0; -20 -20 0; 0 0 0; 20 20 0; 35 -20 0];
smoothTrajectory(car,waypoints);

plot(scenario)