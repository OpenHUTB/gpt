%道路中心坐标[-50 50 0; -50 -50 0; 0 0 0; 0 10 0; 0 25 0; 20 40 0]
scenario = drivingScenario;
roadCenters = [-50 50 0; -50 -50 0; 0 0 0; 0 10 0; 0 25 0; 20 40 0];

%建立道路
%4车道 实线-实线-黄色双实线-实线-实线  
solidW = laneMarking('Solid','Width',0.3);
doubleY = laneMarking('DoubleSolid','Color','yellow');
lspec = lanespec([2 2],'Width',[5 5 5 5], ...
    'Marking',[solidW solidW doubleY solidW solidW]);
%生成道路
road(scenario, roadCenters, 'Lanes', lspec);

% 展示场景
plot(scenario);