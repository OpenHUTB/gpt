% 创建一个驾驶场景，其中包含以场景世界坐标指定的 8 字形道路,将场景的世界坐标转换为自我车辆的坐标系
scenario = drivingScenario;
% 在场景中添加八字形道路
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