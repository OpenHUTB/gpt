% 创建一个驾驶场景。指定道路中心和车道数，增加一条从上到下的54米双向双车道直路,并创建宽度为0.25米的实体线，构成双向道路最外侧车道线，颜色设置为红色，并在两个车道上各生成一辆车
scenario = drivingScenario('StopTime',10);
roadCenters = [50 0; -4 0];
numLanes = [1 1];
outerLM = laneMarking('Solid','Width',0.25);
ls = lanespec(numLanes,'Marking',outerLM);
road(scenario,roadCenters,'Lanes',ls)
v1 = vehicle(scenario,"ClassID",1,"Position",[46 1.5 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[0 -1.5 0]);
plot(scenario)