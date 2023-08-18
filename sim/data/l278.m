% 创建一个场景，生成一条在道路尽头有一个长为4的障碍物的路，并在道路上生成一辆小车
scenario2 = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario2,roadCenters);
barrierCenters = [20 3; 20 -1];
barrier(scenario2,barrierCenters)
v1 = vehicle(scenario2,"ClassID",1,"Position",[5 1.5 0]);
plot(scenario2)