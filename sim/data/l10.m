% 创建一条宽度为3，形状为8字形的道路
scenario = drivingScenario('StopTime',3);
roadCenters = [0  0  1
             20 -20  1
             20  20  1
            -20 -20  1
            -20  20  1
              0   0  1];

roadWidth = 3;
bankAngle = [0 15 15 -15 -15 0];
road(scenario,roadCenters,roadWidth,bankAngle);
plot(scenario)
