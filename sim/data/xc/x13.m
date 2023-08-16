% 创建一个驾驶场景,在原点和(50,0)之间创建一条直线道路
scenario = drivingScenario;
roadCenters = [0 0; 50 0];
rr = road(scenario,roadCenters);

plot(scenario)