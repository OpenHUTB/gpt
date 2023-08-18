% 在场景中添加一个车辆。将车辆定位在坐标(20，-20)并以80度偏航角定向，并在旁边生成一辆卡车和一辆自行车

scenario = drivingScenario('StopTime',3);

ego = actor(scenario,'ClassID',1,'Position',[20 -20 0],'Yaw',80);
truck = vehicle(scenario,'ClassID',2,'Length',8.2,'Width',2.5,'Height',3.5,'Position',[20 -30 0]);
bicycle = actor(scenario,'ClassID',3,'Length',1.7,'Width',0.45,'Height',1.7,'Position',[10 -20 0]);
plot(scenario)