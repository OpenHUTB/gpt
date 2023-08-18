% 创建一个驾驶场景。指定道路中心和车道数，增加一条从上到下的54米双向双车道直路，并在每个车道上生成一辆车
scenario = drivingScenario('StopTime',10);
roadCenters = [50 0; -4 0];
numLanes = [1 1];
ls = lanespec(numLanes);
road(scenario,roadCenters,'Lanes',ls)
v1 = vehicle(scenario,"ClassID",1,"Position",[46 1.8 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[0 -1.8 0]);
plot(scenario)