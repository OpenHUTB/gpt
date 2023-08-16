% 创建一个视觉传感器，用于生成检测结果。默认情况下，传感器安装在自我车辆的前保险杠上
sensor = visionDetectionGenerator;

bep = birdsEyePlot(XLim=[-40 40],YLim=[-30 30]);
olPlotter = outlinePlotter(bep);
lbPlotter = laneBoundaryPlotter(bep);
lmPlotter = laneMarkingPlotter(bep,DisplayName="Parking lanes");
caPlotter = coverageAreaPlotter(bep,DisplayName="Coverage area");
detPlotter = detectionPlotter(bep,DisplayName="Detections");

% 创建鸟瞰图和绘图仪，以直观显示目标轮廓、道路边界、停车道标记、传感器覆盖区域和探测结果
% 然后，模拟场景并生成检测结果。
while advance(scenario)

    % Plot target outlines.
    [position,yaw,length,width,originOffset,color] = targetOutlines(ego);
    plotOutline(olPlotter,position,yaw,length,width)

    % Plot lane boundaries of ego vehicle.
    rbEgo = roadBoundaries(ego);
    plotLaneBoundary(lbPlotter,rbEgo)

    % Plot parking lane markings.
    [plmv,plmf] = parkingLaneMarkingVertices(ego);
    plotParkingLaneMarking(lmPlotter,plmv,plmf)

    % Plot sensor coverage area.
    mountPosition = sensor.SensorLocation;
    range = sensor.MaxRange;
    orientation = sensor.Yaw;
    fieldOfView = sensor.FieldOfView(1);
    plotCoverageArea(caPlotter,mountPosition,range,orientation,fieldOfView)

    % Generate and plot detections.
    actors = targetPoses(ego);
    time = scenario.SimulationTime;
    [dets,isValidTime] = sensor(actors,time);
    if isValidTime
        positions = cell2mat(cellfun(@(x)([x.Measurement(1) x.Measurement(2)]), ...
            dets,UniformOutput=false));
        plotDetection(detPlotter,positions)
    end

end
