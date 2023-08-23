% 在场景中创建一个身高为一米四的行人，并在旁边生成一辆卡车

scenario = drivingScenario('StopTime',3);
ped = actor(scenario,'ClassID',4,'Length',0.2,'Width',0.4,'Height',1.4);
truck = vehicle(scenario,'ClassID',2,'Length',8.2,'Width',2.5,'Height',3.5,'Position',[5 -5 0]);
plot(scenario)