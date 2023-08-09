% 向场景中添加车辆。设置车辆进入弯道时减速的轨迹
scenario = drivingScenario('SampleTime',0.05);
roadcenters = [0 0; 24.2 27.7; 50 30];
lspec = lanespec(2);
road(scenario,roadcenters,'Lanes',lspec);

v = vehicle(scenario,'ClassID',1);
waypoints = [2.6 1.0; 23.6 24.9; 45.5 28.6];
speed = [9 8 9];
smoothTrajectory(v,waypoints,speed)

% 绘制场景并运行模拟
plot(scenario,'Waypoints','on','RoadCenters','on')
while advance(scenario)
    pause(scenario.SampleTime)
end