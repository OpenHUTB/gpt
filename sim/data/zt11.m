%生成一条长为120的道路和三辆车v1,v2,v3;v1的位置为x=68 y=-1 z=0 ,v2的位置为x=83 y=-2 z=0,v3固定运动轨迹
scenario = drivingScenario;
roadCenters = [0 0; 120 0];
road(scenario, roadCenters, 'Lanes', lanespec(3));
v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);
v3 = vehicle(scenario, 'ClassID', 1);
v1.Position = [68 -1 0];
v2.Position = [83 -2 0];
trajectory(v3,[0 0; 50 0]);