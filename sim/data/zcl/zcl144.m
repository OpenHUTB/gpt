%道路中心坐标[-60 60 0; -80 40 0; -50 40 0; -20 40 0; -40 10 0; -10 10 0]
scenario = drivingScenario;
roadCenters = [-60 60 0; -80 40 0; -50 40 0; -20 40 0; -40 10 0; -10 10 0];

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