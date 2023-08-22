% 创建一个驾驶场景并添加一条弯曲的道路
scenario = drivingScenario;
roadCenters = [-14.1 -4.3; 9 -10; 37 -8; 60 3.9; 81.2 29.4; 83.4 57.9];
road1 = road(scenario,roadCenters);
barrier(scenario,road1)
% 沿道路左侧边缘添加另一个隔离栅，与边缘的横向偏移为 1.5 米。指定各段隔离栏之间的间距为 1 米。
barrier(scenario,road1,'RoadEdge',"left",'SegmentGap',1.5,'RoadEdgeOffset',1)
plot(scenario);