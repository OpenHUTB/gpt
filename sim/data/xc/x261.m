% 创建一个驾驶场景，其中包含一条 50 米长的道路和一个 20×30 米长的停车场,绘制场景图
scenario = drivingScenario;
roadcenters = [0 50; 50 0];
road(scenario,roadcenters);

vertices = [40 10; 25 -5; 5 15; 20 30];
lot = parkingLot(scenario,vertices);
% 在地块中插入停车网格。指定一个两行八个车位的网格。
% 使用默认的停车位尺寸，并将网格放置成 45 度角，使其与道路对齐
space = parkingSpace;
numSpaces = 8;
insertParkingSpaces(lot,space,numSpaces,Rows=2,Position=[15 20],Orientation=45)
plot(scenario)