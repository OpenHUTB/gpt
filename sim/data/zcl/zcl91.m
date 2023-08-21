%道路中心坐标[-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;-10 10 0; -10 -15 0; -20 -20 0]
scenario = drivingScenario;
roadCenters = [-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;
    -10 10 0; -10 -15 0; -20 -20 0];

%建立道路
%分界线线型 边界实线，内部都是虚线  
marking = [laneMarking('Solid') ...
    laneMarking('Dashed') laneMarking('Dashed') laneMarking('Dashed') laneMarking('Solid')];
%道路规范 4车道+分界线线型
laneSpecification = lanespec(4, "marking", marking);
%生成道路
road(scenario, roadCenters, 'Lanes', laneSpecification);

% 展示场景
plot(scenario);