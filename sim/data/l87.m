% 创建一个驾驶场景。指定道路中心和车道数，增加一条从上到下的54米双向双车道直路,并创建宽度为0.25米的实体线，构成双向道路最外侧车道线，颜色设置为红色
scenario = drivingScenario('StopTime',10);
roadCenters = [50 0; -4 0];
numLanes = [1 1];
outerLM = laneMarking('Solid','Width',0.25);
ls = lanespec(numLanes,'Marking',outerLM);
road(scenario,roadCenters,'Lanes',ls)
plot(scenario)