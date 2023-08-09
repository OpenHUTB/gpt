% 创建一个驾驶场景。指定道路中心和车道数，增加一条从上到下的54米双向双车道直路,并创建宽度为0.25米的实体线，构成双向道路最外侧车道线,颜色设置为青色，双向车道分隔线设置为虚实线交替
scenario = drivingScenario('StopTime',10);
roadCenters = [50 0; -4 0];
numLanes = [1 1];
outerLM = laneMarking('Solid','Width',0.25,'Color','cyan');
lmArray = [laneMarking('DoubleSolid','Color','Yellow','Width',0.25)
           laneMarking('DashedSolid','Color','Yellow','Length',1,'Space',1.5,'Width',0.25)
           laneMarking('DoubleSolid','Color','Yellow','Width',0.25)
           laneMarking('SolidDashed','Color','Yellow','Length',1,'Space',1.5,'Width',0.25)];
centerLM = laneMarking(lmArray,'SegmentRange',[0.1 0.25 0.2 0.35]);
marking = [outerLM centerLM outerLM];
ls = lanespec(numLanes,'Width',7,'Marking',marking);
road(scenario,roadCenters,'Lanes',ls)
plot(scenario)