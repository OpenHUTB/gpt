scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario, roadCenters, 'Lanes',lanespec(2));

egoVehicle = vehicle(scenario, 'ClassID',1);


% 给车辆添加轨迹
waypoints = [0 0 0;
    7.55 0.03 0.01;
    12.16 0.16 0.01;
    17.35 0.16 0.01;
    21.64 0.67 0.01;
    25.48 0.42 0.01;
    29.71 0.61 0.01];
speed = [30;30;30;30;30;30;30];
trajectory(egoVehicle, waypoints, speed);