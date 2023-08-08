% 为四车道的道路创建一个lanespec对象。使用laneMarking函数指定它的五个车道标记。中线为双实双黄。最外层的线条是纯白色的。内线是虚线和白色的
scenario = drivingScenario;
roadCenters = [0 0; 80 0];
solidW = laneMarking('Solid','Width',0.3);
dashW = laneMarking('Dashed','Space',5);
doubleY = laneMarking('DoubleSolid','Color','yellow');
lspec = lanespec([2 2],'Width',[5 5 5 5], ...
    'Marking',[solidW dashW doubleY dashW solidW]);
road(scenario,roadCenters,'Lanes',lspec);
plot(scenario)