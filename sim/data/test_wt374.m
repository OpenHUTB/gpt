% 创建一段八米长的三车道和仨行人
scenario = drivingScenario;
r=8;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 5.5 0];
b = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
b.Position = [unifrnd(0,r) -5.5 0];
c = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
c.Position = [unifrnd(0,r) 5.5 0];

