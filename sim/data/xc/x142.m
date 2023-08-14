% 创建一个包含四向交叉路口的驾驶场景
scenario = drivingScenario('SampleTime',0.02,'StopTime',20);
% 十字路口坐标分别为[0 0; 50 0]和[25 25; 25 -25]
roadCenters = [0 0; 50 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);

roadCenters = [25 25; 25 -25];
road(scenario,roadCenters,'Lanes',laneSpecification);
% 增加车辆，该车向北行驶，但在十字路口等待2秒钟
ego = vehicle(scenario,'ClassID',1,'Position',[2 -2 0]);
waypoints = [2 -2; 17.5 -2; 45 -2];
speed = [5 0 5];
waittime = [0 2 0];
smoothTrajectory(ego,waypoints,speed,waittime);
plot(scenario)