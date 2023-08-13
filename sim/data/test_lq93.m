% 生成一条车道变窄的道路长62m和一辆车
scenario = drivingScenario;
roadCenters = [0 0; 62 0];
% 为两个单行道路段定义一个车道规格的数组。请注意，在第二个道路片段中有一个车道减少。
lsArray = [lanespec(3) lanespec(2)];
% 定义一个道路段连接器对象。指定要减少一个车道的位置。以及锥形长度。
lc = laneSpecConnector('Position','Left','TaperLength',30);
% 组合道路段的车道规格。
clspec = compositeLaneSpec(lsArray,'Connector',lc);
road(scenario,roadCenters,'lanes',clspec);
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 展示场景
plot(scenario,'RoadCenters','on');