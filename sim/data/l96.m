% 创建一条25米长的直道，在一个方向上有三条车道,最左边车道类型为停车道，另外两车道为行驶道
scenario = drivingScenario('StopTime',3);
lm = [laneMarking('Solid')
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Solid')];
parkinglane = laneType('Parking');
drivinglane = laneType('Driving');
it = [parkinglane drivinglane drivinglane];
l = lanespec(3,'Marking',lm,'Type',it);
road(scenario,[0 0 0; 25 0 0],'Lanes',l);
plot(scenario)