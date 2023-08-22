%定义一条分岔路口，直线路段为三车道，长度为170m
scenario = drivingScenario;
ls = lanespec(2);
laneWidth = ls.Width(1);
% 添加直线道路段
road(scenario, [0 0 0; 170 0 0], 'lanes', lanespec(3));
% 定义车道出口的航点
roadCenters =  [3.0 -laneWidth/2
                3.1 -laneWidth/2
               15.0 -laneWidth
              45.0 -20];
% 增加出口车道
road(scenario, roadCenters, laneWidth);
