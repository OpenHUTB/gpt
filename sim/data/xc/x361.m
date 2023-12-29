% 将 ASAM OpenDRIVE 道路网络导入到场景中。
scenario = drivingScenario;
filePath = 'roundabout.xodr';  
roadNetwork(scenario,'OpenDRIVE',filePath);
% 绘制场景图，并通过设置坐标轴限制放大道路网络,x为[-250 152], y为[-175 225]
plot(scenario)
xlim([-250 152])
ylim([-175 225])