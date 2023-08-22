% 创建一个包含道路和停车场的驾驶场景
scenario = drivingScenario;
roadcenters = [10 40; 10 -40];
road(scenario,roadcenters);
vertices = [0 20; 20 20; 20 -20; 0 -20];
parkingLot(scenario,vertices,ParkingSpace=parkingSpace);

plot(scenario)