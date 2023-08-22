% 创建一个驾驶场景。指定道路中心和车道数，以添加一条 54 米长的双向双车道直线道路，其绘制方向为从上到下.
scenario = drivingScenario('StopTime',10);
roadCenters = [50 0; -4 0];
numLanes = [1 1];
% 创建一个标线宽度为 0.16 米的实心标线对象，构成双向道路最外侧的车道标线
outerLM = laneMarking('Solid','Width',0.16);
% 创建包含实线和虚线双黄线属性的实线标记和虚线标记对象的车道标记数组
lmArray = [laneMarking('DoubleSolid','Color','Yellow','Width',0.25)
           laneMarking('DashedSolid','Color','Yellow','Length',1,'Space',1.5,'Width',0.25)
           laneMarking('DoubleSolid','Color','Yellow','Width',0.25)
           laneMarking('SolidDashed','Color','Yellow','Length',1,'Space',1.5,'Width',0.25)];
centerLM = laneMarking(lmArray,'SegmentRange',[0.1 0.25 0.2 0.35]);

marking = [outerLM centerLM outerLM];
ls = lanespec(numLanes,'Width',7,'Marking',marking);

road(scenario,roadCenters,'Lanes',ls);
figMark = figure;
set(figMark,'Position',[0 0 600 600]);
hPlot = axes(figMark);
plot(scenario,'Parent',hPlot);
title('Composite Marking: Road with Passing Zones')