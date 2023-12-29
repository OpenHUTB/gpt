%道路中心坐标[-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;-10 10 0; -10 -15 0; -20 -20 0]
scenario = drivingScenario;
roadCenters = [-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;
    -10 10 0; -10 -15 0; -20 -20 0];

%建立道路
%4车道 实线-虚线-黄色双实线-虚线-实线  
solidW = laneMarking('Solid','Width',0.3);
dashW = laneMarking('Dashed','Space',5);
doubleY = laneMarking('DoubleSolid','Color','yellow');
lspec = lanespec([2 2],'Width',[5 5 5 5], ...
    'Marking',[solidW dashW doubleY dashW solidW]);
%生成道路
road(scenario, roadCenters, 'Lanes', lspec);

% 展示场景
plot(scenario);