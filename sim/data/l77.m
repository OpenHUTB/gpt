% 创建一个场景，生成一条在道路尽头有一个长为2的障碍物的路
scenario2 = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario2,roadCenters);
barrierCenters = [20 3; 20 1];
barrier(scenario2,barrierCenters)
plot(scenario2)