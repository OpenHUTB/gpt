% 生成一段110m的三车道路和三辆车，车辆v1的初始位置为x=20,y=3,z=0，车辆v2的初始位置为x=4,y=2,z=0，车辆v3的初始位置为x=50,y=2,z=0
scenario = drivingScenario;
roadCenters = [0 0; 110 0];
road(scenario, roadCenters, 'Lanes', lanespec(3));
v1 = vehicle(scenario, 'ClassID', 1);
v2 = vehicle(scenario, 'ClassID', 1);
v3 = vehicle(scenario, 'ClassID', 1);
% 调整车辆的初始位置
v1.Position = [20 -2 0];%车辆v1的初始位置为x=20,y=3,z=0
v2.Position = [4 2 0];%车辆v2的初始位置为x=4,y=2,z=0
v3.Position = [50 2 0];%车辆v3的初始位置为x=50,y=2,z=0