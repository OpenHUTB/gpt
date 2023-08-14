% 创建一个包含四向交叉路口的驾驶场景
scenario = drivingScenario('SampleTime',0.02,'StopTime',20);
% 十字路口坐标分别为[0 0; 150 0]和[75 75; 75 -75]
roadCenters = [0 0; 150 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);

roadCenters = [75 75; 75 -75];
road(scenario,roadCenters,'Lanes',laneSpecification);

plot(scenario)