% 创建一个驾驶场景,在原点和(20,0)之间创建一条直线道路
scenario = drivingScenario;
roadCenters = [0 0; 20 0];
rr = road(scenario,roadCenters);
% 指定适当的护栏中心，并在道路上增设护栏，覆盖整个道路宽度,SegmentGap设为0.8
barrierCenters = [20 3; 20 0; 20 -3];
barrier(scenario,barrierCenters,'SegmentGap',0.8)

plot(scenario)