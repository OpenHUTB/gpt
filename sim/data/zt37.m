% 生成一段三车道的130m的道路和一辆车并规定车的运动轨迹
scenario = drivingScenario;
roadCenters = [0 0; 130 0];
road(scenario,roadCenters,'Lanes',lanespec(3));
v = vehicle(scenario,'ClassID',1);
trajectory(v,[1 0; 50 0]);%规定车辆的运动轨迹