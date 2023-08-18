% 在场景中添加一个车辆。将车辆定位在坐标(20，-20)并以65度偏航角定向，并在旁边生成一辆卡车

scenario = drivingScenario('StopTime',3);

ego = actor(scenario,'ClassID',1,'Position',[20 -20 0],'Yaw',65);
truck = vehicle(scenario,'ClassID',2,'Length',8.2,'Width',2.5,'Height',3.5,'Position',[20 -30 0]);
plot(scenario)