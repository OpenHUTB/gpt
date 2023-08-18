% 创建一条25米长的直道，在一个方向上有两条车道,车道类型为应急车道，并在道路上生成一辆车
scenario = drivingScenario('StopTime',3);
lm = [laneMarking('Solid')
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Solid')];
it = laneType('Shoulder');
l = lanespec(2,'Marking',lm,'Type',it);
road(scenario,[0 0 0; 25 0 0],'Lanes',l);
v1 = vehicle(scenario,"ClassID",1,"Position",[4 1.8 0]);
plot(scenario)