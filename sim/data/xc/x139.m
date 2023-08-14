% 创建一个包含四向交叉路口的驾驶场景
scenario = drivingScenario('SampleTime',0.02,'StopTime',20);
% 十字路口坐标分别为[0 0; 75 0]和[25 25; 25 -25]
roadCenters = [0 0; 75 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);

roadCenters = [25 25; 25 -25];
road(scenario,roadCenters,'Lanes',laneSpecification);

plot(scenario)