% 画出一条路，路上有五个行人
scenario = drivingScenario;
r=unidrnd(50);
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unidrnd(r) -2 0];
b = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unidrnd(r) 2 0];
c = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
c.Position = [unidrnd(r) -2 0];
d = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
d.Position = [unidrnd(r) 2 0];
e = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
e.Position = [unidrnd(r) -2 0];



