% 创建一个驾驶场景，其中包含一条短路，进入一个长 52 米、宽 20 米的停车场
% 绘制停车场图并显示可插入停车位的边缘编号
% 由于边缘 3 与道路交界，其边缘编号不会显示在绘图上，但您仍可沿其插入车位
scenario = drivingScenario;
roadcenters = [25 30; 25 15];
road(scenario,roadcenters);

vertices = [0 0; 52 0; 52 20; 0 20];
lot = parkingLot(scenario,vertices);
plot(scenario,ParkingLotEdges="On")