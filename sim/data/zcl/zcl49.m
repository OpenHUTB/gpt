%道路中心坐标[-50 50 0; -50 -50 0; 0 0 0; 50 50 0; 80 50 0]
scenario = drivingScenario;
roadCenters = [-50 50 0; -50 -50 0; 0 0 0; 50 50 0; 80 50 0];

%建立道路
%分界线线型 实线 虚线 实线  
marking = [laneMarking('Solid') ...
    laneMarking('Dashed')  laneMarking('Dashed') laneMarking('Solid')];
%道路规范 3条车道+分界线线型
laneSpecification = lanespec(3, "marking", marking);
%生成道路
road(scenario, roadCenters, 'Lanes', laneSpecification);

% 展示场景
plot(scenario);