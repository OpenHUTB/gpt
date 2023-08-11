% 创建1条1000米的四车道路和1个行人
scenario = drivingScenario;
r=1000;
roadCenters = [0 0; r 0];
road(scenario,roadCenters,'Lanes',lanespec(4));
a = actor(scenario,'ClassID',4,'Length',0.24,'Width',0.45,'Height',1.7);
a.Position = [unifrnd(0,r) 7.3 0];
