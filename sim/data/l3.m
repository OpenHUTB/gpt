% 获取场景中道路边界
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
roadcenters = [700 0 0; 100 0 0];
sr1 = road(scenario,roadcenters);
barrier(scenario,sr1)
barrier(scenario,sr1,'RoadEdge','left')
roadcenters = [400 400 0; 0 0 0];
road(scenario,roadcenters);
% 获取场景中道路边界
rbdry = roadBoundaries(scenario);
plot(scenario,'Centerline','on','RoadCenters','on');

