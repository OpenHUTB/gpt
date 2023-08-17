% 配置鸟瞰图需要两个步骤。第一步，创建鸟瞰图，设置上述坐标系，其中 x 轴向上，y 轴向左。
% 可以定义每个方向的坐标轴极限
% 在这个前视示例中，我们将场景定义为自我车辆前方 90 米处和两侧各 35 米处。
BEP = birdsEyePlot('Xlimits', [0 90], 'Ylimits', [-35 35]);

cap(1) = coverageAreaPlotter(BEP,'FaceColor','blue','EdgeColor','blue');
cap(2) = coverageAreaPlotter(BEP,'FaceColor','red','EdgeColor','red');
cap(3) = coverageAreaPlotter(BEP,'FaceColor','red','EdgeColor','red');

load('SensorConfigurationData.mat');
% Use the sensor configuration to plot the sensor coverage areas. Vision
% sensor uses the shaded blue coverage area and radar modes are shaded in
% red.
for i = 1:3
    plotCoverageArea(cap(i), [sensorParams(i).X, sensorParams(i).Y],...
        sensorParams(i).Range, sensorParams(i).YawAngle, sensorParams(i).FoV);
end

% Add title
title('Bird''s-Eye Plot')