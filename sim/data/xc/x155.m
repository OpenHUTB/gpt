% 创建一个视觉传感器,安装在自我车辆的前保险杠上,将传感器配置为最大探测距离 53 米
sensor = visionDetectionGenerator('SensorIndex',1, ...
    'SensorLocation',[3.7 0], ...
    'MaxRange',53);
% 绘制车辆轮廓和传感器的覆盖范围,最近的目标车辆在传感器的范围内,但最远的目标车辆不在范围内
bep = birdsEyePlot;

olPlotter = outlinePlotter(bep);
[position,yaw,length,width,originOffset,color] = targetOutlines(egoVehicle);
plotOutline(olPlotter,position,yaw,length,width, ...
    'OriginOffset',originOffset,'Color',color)

caPlotter = coverageAreaPlotter(bep,'DisplayName','Coverage area','FaceColor','blue');
mountPosition = sensor.SensorLocation;
range = sensor.MaxRange;
orientation = sensor.Yaw;
fieldOfView = sensor.FieldOfView(1);
plotCoverageArea(caPlotter,mountPosition,range,orientation,fieldOfView);