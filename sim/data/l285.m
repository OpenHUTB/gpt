% 创建一个场景，生成一条在道路尽头有两个长为3的障碍物，且障碍物间隔为0.2的路，再在道路中间生成两个障碍物，每个障碍物长度为道路的一般，并在道路上生成一辆小车
scenario2 = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario2,roadCenters);
barrierCenters = [20 3; 20 0; 20 -3];
barrier(scenario2,barrierCenters,'SegmentGap',0.2)
barrierCenters1 = [12 3; 12 0];
barrierCenters2 = [6 -3; 6 0];
barrier(scenario2,barrierCenters1,'SegmentGap',0.2)
barrier(scenario2,barrierCenters2,'SegmentGap',0.2)
v1 = vehicle(scenario2,"ClassID",1,"Position",[5 1.5 0]);
plot(scenario2)