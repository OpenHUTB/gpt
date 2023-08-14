% 创建一个包含道路和停车场的驾驶场景
scenario = drivingScenario;
roadcenters = [10 40; 10 -40];
road(scenario,roadcenters);
vertices = [0 20; 20 20; 20 -20; 0 -20];
parkingLot(scenario,vertices,ParkingSpace=parkingSpace);
% 添加一辆自我车辆，并指定车辆驶过停车场的轨迹
ego = vehicle(scenario);
waypoints = [10 35 0; 10 10 0];
speed = 5; % m/s
smoothTrajectory(ego,waypoints,speed)

plot(scenario)