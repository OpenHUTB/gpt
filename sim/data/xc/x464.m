% 创建一个驾驶场景,将场景的停止时间设置为 3 秒
scenario = drivingScenario('StopTime',3)
% 在场景中增加一条双车道公路
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);
% 添加另一条道路，与第一条道路成直角相交，形成 T 形, 位置为[20.8 38.4 0; 20.8 3 0]
roadCenters = [20.8 38.4 0; 20.8 3 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification)

plot(scenario)