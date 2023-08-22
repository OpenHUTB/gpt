% 创建一个驾驶场景并添加一条弯曲的道路,在道路右侧增设隔离栏
scenario = drivingScenario;
roadCenters = [-14.1 -4.3; 9 -10; 37 -8; 60 3.9; 81.2 29.4; 83.4 57.9];
road1 = road(scenario,roadCenters);
barrier(scenario,road1)
plot(scenario);