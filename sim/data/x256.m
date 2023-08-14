% 创建一个驾驶场景，其中包含一条 51 米长的道路和一个 20×30 米长的停车场,绘制场景图
scenario = drivingScenario;
roadcenters = [0 51; 51 0];
road(scenario,roadcenters);

vertices = [40 10; 25 -5; 5 15; 20 30];
lot = parkingLot(scenario,vertices);
plot(scenario)