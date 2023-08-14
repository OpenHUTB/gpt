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
% 在多个停车位上创建停放的汽车。绘制场景图
parkedCar1 = vehicle(scenario,Position=[15.8 12.4 0]);
parkedCar2 = vehicle(scenario,Position=[15.8 -12.4 0]);
parkedCar3 = vehicle(scenario,Position=[2 -9.7 0]);
parkedCar4 = vehicle(scenario,Position=[2 9.7 0]);
plot(scenario)