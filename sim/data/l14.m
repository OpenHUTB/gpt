% 创建一个包含弯曲双车道道路的驾驶场景
scenario = drivingScenario('SampleTime',0.05);
roadcenters = [0 0; 24.2 27.7; 50 30];
lspec = lanespec(2);
road(scenario,roadcenters,'Lanes',lspec);