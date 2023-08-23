% 在场景中创建一个身高为一米八五的行人，并在旁边生成一辆卡车和一辆自行车

scenario = drivingScenario('StopTime',3);
ped = actor(scenario,'ClassID',4,'Length',0.2,'Width',0.4,'Height',1.85);
truck = vehicle(scenario,'ClassID',2,'Length',8.2,'Width',2.5,'Height',3.5,'Position',[5 -5 0]);
bicycle = actor(scenario,'ClassID',3,'Length',1.7,'Width',0.45,'Height',1.7,'Position',[2 2 0]);
plot(scenario)