% 创建一个包含非矩形布局停车场的驾驶场景。绘制停车场平面图，并显示可添加停车位的边线编号
scenario = drivingScenario;
vertices = [0 0; 32 -10.5; 32 -50.5; 25 -57.5; 0 -57.5];
lot = parkingLot(scenario,vertices);
plot(scenario,ParkingLotEdges="on")