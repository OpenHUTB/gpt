%道路中心坐标[-50 50 0; -50 -50 0; 10 0 0]
scenario = drivingScenario;
roadCenters = [-50 50 0; -50 -50 0; 10 0 0];

%建立道路
%2车道 实线-黄色双虚线-实线  
solidW = laneMarking('Solid','Width',0.3);
doubleY = laneMarking('DoubleDashed','Color','yellow');
lspec = lanespec(2,'Marking',[solidW doubleY solidW]);
%生成道路
road(scenario, roadCenters, 'Lanes', lspec);
% 展示场景
plot(scenario);