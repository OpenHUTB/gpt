% 产生一条125米的路和路同侧快步走的2个行人
scenario = drivingScenario;
r=125;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 2 0];
b =actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) 2 0];
waypoints_a = [unifrnd(0,r) 2;r 2];
waypoints_b = [unifrnd(0,r) 2;r 2];
speed= 4;
smoothTrajectory(a,waypoints_a,speed);
smoothTrajectory(b,waypoints_b,speed);


