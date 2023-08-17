% 创建一个驾驶场景,将场景的停止时间设置为 5 秒
scenario = drivingScenario('StopTime',5)
% 在场景中增加一条双车道公路
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);

plot(scenario)