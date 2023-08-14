% 创建一个驾驶场景，包含一条笔直的三车道公路
scenario = drivingScenario;
roadCenters = [0 0; 80 0];
road(scenario,roadCenters,'Lanes',lanespec([1 2],'Width',3));
% 添加一辆以每秒 20 米速度行驶的自我车辆和一辆以每秒 15 米速度行驶的目标车辆
ego = vehicle(scenario,'ClassID',1,'Position',[5 0 0], ...
    'Length',3,'Width',2,'Height',1.6);
smoothTrajectory(ego,[1 0 0; 20 0 0; 30 0 0;50 0 0],20);

target = vehicle(scenario,'ClassID',1,'Position',[5 0 0], ...
    'Length',3,'Width',2,'Height',1.6);
smoothTrajectory(target,[5 -3 0; 20 -3 0; 30 -3 0;50 -3 0],15);

plot(scenario)

while advance(scenario)
    [cl1,numlanes] = currentLane(ego);
    [cl2,numlanes] = currentLane(target);
end