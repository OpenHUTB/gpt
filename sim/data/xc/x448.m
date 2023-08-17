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
% 创建鸟瞰图和相关绘图仪
%显示传感器覆盖区域
%显示车道标记。
%获取道路上目标的地面真实姿态
%获取前方 60 米处的理想车道边界点
%根据理想的目标姿态和车道边界生成检测结果
%显示目标轮廓
%当目标检测有效时，显示目标检测结果
%车道检测有效时显示车道边界
bep = birdsEyePlot('XLim',[0 60],'YLim',[-35 35]);
caPlotter = coverageAreaPlotter(bep,'DisplayName','Coverage area', ...
    'FaceColor','blue');
detPlotter = detectionPlotter(bep,'DisplayName','Object detections');
lmPlotter = laneMarkingPlotter(bep,'DisplayName','Lane markings');
lbPlotter = laneBoundaryPlotter(bep,'DisplayName', ...
    'Lane boundary detections','Color','red');
olPlotter = outlinePlotter(bep);
plotCoverageArea(caPlotter,visionSensor.SensorLocation,...
    visionSensor.MaxRange,visionSensor.Yaw, ...
    visionSensor.FieldOfView(1));
while advance(scenario)
    [lmv,lmf] = laneMarkingVertices(egovehicle);
    plotLaneMarking(lmPlotter,lmv,lmf)
    tgtpose = targetPoses(egovehicle);
    lookaheadDistance = 0:0.5:60;
    lb = laneBoundaries(egovehicle,'XDistance',lookaheadDistance,'LocationType','inner');
    [obdets,nobdets,obValid,lb_dets,nlb_dets,lbValid] = ...
        visionSensor(tgtpose,lb,scenario.SimulationTime);
    [objposition,objyaw,objlength,objwidth,objoriginOffset,color] = targetOutlines(egovehicle);
    plotOutline(olPlotter,objposition,objyaw,objlength,objwidth, ...
        'OriginOffset',objoriginOffset,'Color',color)
    if obValid
        detPos = cellfun(@(d)d.Measurement(1:2),obdets,'UniformOutput',false);
        detPos = vertcat(zeros(0,2),cell2mat(detPos')');
        plotDetection(detPlotter,detPos)
    end
    if lbValid
        plotLaneBoundary(lbPlotter,vertcat(lb_dets.LaneBoundaries))
    end
end