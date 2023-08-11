% 创建一个包含弯曲双向单车道道路的驾驶场景，弯曲度大一点
scenario = drivingScenario('SampleTime',0.05);
roadcenters = [0 0; 24.2 27.7; 50 30; 72 5];
lspec = lanespec([1 1]);
road(scenario,roadcenters,'Lanes',lspec);
plot(scenario)