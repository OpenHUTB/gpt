% 创建一个驾驶场景,在原点和(20,0)之间创建一条直线道路
scenario = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario,roadCenters);
% 指定适当的护栏中心，并在道路上增设护栏，覆盖整个道路宽度,SegmentGap设为0.8
barrierCenters = [20 3; 20 0; 20 -3];
barrier(scenario,barrierCenters,'SegmentGap',0.8)
% 在道路上增设两个路障，每个路障占道路宽度的一半
barrierCenters1 = [12 3; 12 0];
barrierCenters2 = [6 -3; 6 0];
barrier(scenario,barrierCenters1,'SegmentGap',0.2)
barrier(scenario,barrierCenters2,'SegmentGap',0.2)

plot(scenario)