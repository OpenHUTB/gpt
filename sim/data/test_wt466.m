% 创建一条一百二十五米的两车道路和六个行人
scenario = drivingScenario;
r=125;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 3.6 0];
b = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) -3.6 0];
c = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
c.Position = [unifrnd(0,r) 3.6 0];
d = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
d.Position = [unifrnd(0,r) -3.6 0];
e = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
e.Position = [unifrnd(0,r) 3.6 0];
f = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
f.Position = [unifrnd(0,r) -3.6 0];


