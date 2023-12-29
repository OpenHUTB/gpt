% 创建一个驾驶场景，其中包含一辆行驶在 46 米长直线路段上的车辆。绘制场景图
scenario = drivingScenario;
roadcenters = [0 0 0; 46 0 0];
road(scenario,roadcenters);
  
v = vehicle(scenario,'ClassID',1);
v.Position = [1 0 0];

plot(scenario)