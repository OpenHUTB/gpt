% 为一条 300 米长的笔直道路创建一个驾驶场景和道路中心
scenario = drivingScenario;
roadCenters = [0 0; 300 0];
% 为四车道道路创建 lanespec 对象。使用 laneMarking 函数指定其五个车道标记。中线为双实线和双黄线。最外侧的线为白色实线。内线为白色虚线。
solidW = laneMarking('Solid','Width',0.3);
dashW = laneMarking('Dashed','Space',5);
doubleY = laneMarking('DoubleSolid','Color','yellow');
lspec = lanespec([2 2],'Width',[5 5 5 5], ...
    'Marking',[solidW dashW doubleY dashW solidW]);

road(scenario,roadCenters,'Lanes',lspec);
plot(scenario)
