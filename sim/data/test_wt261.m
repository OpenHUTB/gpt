% 生成一段一千二百米双车道和一个行人
scenario = drivingScenario;
r=1200;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 3.6 0];

