% 创建一条25米长的直道，在一个方向上有四条车道,最左边车道类型为停车道，第二车道为行驶道，第三车道为大型车道，最右侧为应急车道，并在道路上生成一辆车
scenario = drivingScenario('StopTime',3);
lm = [laneMarking('Solid')
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Dashed','Length',2,'Space',4)
      laneMarking('Solid')];
parkinglane = laneType('Parking');
drivinglane = laneType('Driving');
shoulderlane = laneType('Shoulder');
restrictedlane = laneType('Restricted');
it = [parkinglane drivinglane restrictedlane shoulderlane];
l = lanespec(4,'Marking',lm,'Type',it);
road(scenario,[0 0 0; 25 0 0],'Lanes',l);
v1 = vehicle(scenario,"ClassID",1,"Position",[4 4.8 0]);
plot(scenario)