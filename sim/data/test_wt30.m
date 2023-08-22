% 画出一段四车道的路和两个行人
scenario = drivingScenario;
r=unifrnd(30,50);
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 7.3 0];
b = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) -7.3 0];
