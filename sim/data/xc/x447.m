% 创建一个驾驶场景，其中包含一辆在三车道道路上行驶的自我车辆和一辆目标车辆。使用视觉检测生成器检测车道边界。
scenario = drivingScenario;
% 使用车道规格创建三车道道路
roadCenters = [0 0 0; 60 0 0; 120 30 0];
lspc = lanespec(3);
road(scenario,roadCenters,'Lanes',lspc);
% 规定ego车辆以 30 米/秒的速度沿中央车道行驶
egovehicle = vehicle(scenario,'ClassID',1);
egopath = [1.5 0 0; 60 0 0; 111 25 0];
egospeed = 30;
smoothTrajectory(egovehicle,egopath,egospeed);
% 指定目标车辆以 40 米/秒的速度在自我车辆前方行驶，并在靠近自我车辆的位置变换车道
targetcar = vehicle(scenario,'ClassID',1);
targetpath = [8 2; 60 -3.2; 120 33];
targetspeed = 40;
smoothTrajectory(targetcar,targetpath,targetspeed);
% 显示追逐图，以便从自我车辆后方对场景进行三维查看
chasePlot(egovehicle)
% 创建一个视觉检测发生器，检测车道和物体。传感器的俯仰角向下一度
visionSensor = visionDetectionGenerator('Pitch',1.0);
visionSensor.DetectorOutput = 'Lanes and objects';
visionSensor.ActorProfiles = actorProfiles(scenario);