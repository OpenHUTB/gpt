% 产生1段800米的八车道路和6个行人
scenario = drivingScenario;
r=800;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(8));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 14.4 0];
b = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) -14.4 0];
c = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
c.Position = [unifrnd(0,r) 14.4 0];
d = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
d.Position = [unifrnd(0,r) -14.4 0];
e = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
e.Position = [unifrnd(0,r) 14.4 0];
f = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
f.Position = [unifrnd(0,r) -14.4 0];