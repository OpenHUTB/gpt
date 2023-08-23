% 在场景中创建一个身高为一米五的行人

scenario = drivingScenario('StopTime',3);
ped = actor(scenario,'ClassID',4,'Length',0.2,'Width',0.4,'Height',1.5);
plot(scenario)