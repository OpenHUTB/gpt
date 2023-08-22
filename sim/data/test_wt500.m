% 产生一条一千米的四车道的路和路同侧块步走的两个行人
scenario = drivingScenario;
r=1000;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 7.3 0];
b =actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) 7.3 0];
waypoints_a = [unifrnd(0,r) 7.3;r 7.3];
waypoints_b = [unifrnd(0,r) 7.3;r 7.3];
speed= 4;
smoothTrajectory(a,waypoints_a,speed);
smoothTrajectory(b,waypoints_b,speed);
