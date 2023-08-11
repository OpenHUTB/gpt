% 产生一条一百四十米两车道的路和路两侧漫步的两个行人
scenario = drivingScenario;
r=140;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 3.6 0];
b =actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) -3.6 0];
waypoints_a = [unifrnd(0,r) 3.6;r 3.6];
waypoints_b = [unifrnd(0,r) -3.6;r -3.6];
speed= 2;
smoothTrajectory(a,waypoints_a,speed);
smoothTrajectory(b,waypoints_b,speed);



