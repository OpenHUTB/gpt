% 生成一段三车道的道路和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 100 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v = vehicle(scenario,'ClassID',1);
trajectory(v,[10 0; 50 0]);%规定车辆的运动轨迹