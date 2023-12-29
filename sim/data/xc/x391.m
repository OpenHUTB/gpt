% 生成场景，简单椭圆形赛道，该赛道占地约 200 米长、100 米宽，其弯道的倾斜角为 9 度
scenario = drivingScenario;
roadCenters = ...
    [  0  40  49  50 100  50  49 40 -40 -49 -50 -100  -50  -49  -40    0
     -50 -50 -50 -50   0  50  50 50  50  50  50    0  -50  -50  -50  -50
       0   0 .45 .45 .45 .45 .45  0   0 .45 .45  .45  .45  .45    0    0]';
bankAngles = ...
    [  0   0   9   9   9   9   9  0   0   9   9    9    9    9    0    0];

road(scenario, roadCenters, bankAngles, 'lanes', lanespec(2));
plot(scenario);