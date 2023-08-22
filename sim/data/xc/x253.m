% 创建一个驾驶场景，其中包含一条短路，进入一个长 50 米、宽 20 米的停车场
% 绘制停车场图并显示可插入停车位的边缘编号
% 由于边缘 3 与道路交界，其边缘编号不会显示在绘图上，但您仍可沿其插入车位
scenario = drivingScenario;
roadcenters = [25 30; 25 15];
road(scenario,roadcenters);

vertices = [0 0; 50 0; 50 20; 0 20];
lot = parkingLot(scenario,vertices);
% 沿停车场边缘 1 插入倾斜空间
insertParkingSpaces(lot,space,Edge=1)
% 沿边缘 3 插入倾斜空间：交界处上方 5 个，交界处下方 5 个。
% 这些空格分别从边缘 3 的底部偏移 3 米和 30 米。沿边缘 1 使用的空格角度相反
numSpaces = 5;
space = parkingSpace(Angle=120);
insertParkingSpaces(lot,space,numSpaces,Edge=3,Offset=3)
insertParkingSpaces(lot,space,numSpaces,Edge=3,Offset=30)
plot(scenario,ParkingLotEdges="On")