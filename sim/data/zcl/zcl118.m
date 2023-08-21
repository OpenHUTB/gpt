%道路中心坐标[-50 50 0; -50 -50 0; 0 0 0; 0 10 0; 0 25 0; 20 40 0]
scenario = drivingScenario;
roadCenters = [-50 50 0; -50 -50 0; 0 0 0; 0 10 0; 0 25 0; 20 40 0];

%建立道路
%分界线线型 实线 黄色双实线 实线  
marking = [laneMarking('Solid') ...
    laneMarking('DoubleSolid','Color','yellow') laneMarking('Solid')];
%道路规范 两条车道+分界线线型
laneSpecification = lanespec(2, "marking", marking);
%生成道路
road(scenario, roadCenters, 'Lanes', laneSpecification);

% 展示场景
plot(scenario);