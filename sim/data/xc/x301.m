% 创建一个包含两条需要连接的弯曲道路的驾驶场景,指定每个道路中心的方向角，以微调连接区域的道路形状
scenario = drivingScenario;
% 通过定义道路中心和道路方向角，为驾驶场景添加两条道路。
% Add the first road
roadCenters = [-7 20; 0 0; 30 0; 30 -20; 10 -30];
roadHeadings = [-90; 0; NaN; NaN; -90];
laneMark = laneMarking('Solid');
laneSpecification = lanespec(2,Marking=laneMark);
road(scenario,roadCenters,'Lanes',laneSpecification, ...
    'Heading',roadHeadings,'Name','Road 1');

%Add the second road
roadCenters = [10 -30; 30 -40; 30 -60; 0 -60; -7 -80];
roadHeadings = [-90; NaN; NaN; 180; -90];
laneMark = laneMarking('Dashed');
laneSpecification = lanespec(2,Marking=laneMark);
road(scenario,roadCenters,'Lanes',laneSpecification, ...
    'Heading',roadHeadings,'Name','Road 2');

plot(scenario,'RoadCenters','on')