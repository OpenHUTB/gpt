% 生成一条长69m向左边的出口车道和一辆车
scenario = drivingScenario;
ls = lanespec(2);
laneWidth = ls.Width(1);
% 添加直行道路段
road(scenario, [0 0 0; 69 0 0], 'lanes', lanespec(2));
% 定义车道出口的路点
roadCenters =  [3.0 laneWidth/2
                3.1 laneWidth/2
               15.0 laneWidth
               30.0 30];
% 添加车道出口
road(scenario, roadCenters, laneWidth);
% 添加一辆车
v = vehicle(scenario,'ClassID',1);
% 根据需要调整位置坐标
v.Position = [1 -2 0];
% 展示场景
plot(scenario,'RoadCenters','on')