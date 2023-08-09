% 创建一个场景，生成一条在道路尽头有一个长为4，且在2道路中间的障碍物的路
scenario2 = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario2,roadCenters);
barrierCenters = [20 2; 20 -2];
barrier(scenario2,barrierCenters)
plot(scenario2)