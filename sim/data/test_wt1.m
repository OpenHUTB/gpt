% 生成一段路、一辆车和一个行人
scenario = drivingScenario;
r=unidrnd(50)
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(1));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
passingCar = vehicle(scenario,'ClassID',1);
a.Position = [unidrnd(r) 2 0]
passingCar.Position = [unidrnd(r) -2 0]
