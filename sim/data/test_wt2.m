% 画出1段路和1个行人
scenario = drivingScenario;
r=unidrnd(50)
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unidrnd(r) 2 0]

