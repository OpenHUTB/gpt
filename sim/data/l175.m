% 在场景中添加一个车辆。将车辆定位在坐标(20，-20)并以20度偏航角定向

scenario = drivingScenario('StopTime',3);

ego = actor(scenario,'ClassID',1,'Position',[20 -20 0],'Yaw',20);
plot(scenario)