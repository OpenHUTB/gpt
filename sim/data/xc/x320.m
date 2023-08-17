% 将由行车道和停车道组成的 ASAM OpenDRIVE® 道路导入到场景中
% 默认情况下，该功能会解释车道类型信息并将车道导入到驾驶场景中，而不会更改车道类型
scenario = drivingScenario;

filePath = 'parking.xodr';  
roadNetwork(scenario,'OpenDRIVE',filePath);

plot(scenario)
% zoom的参数控制绘图窗口的缩放系数,1.5 为放大1.5倍
zoom(1.5)
legend('Driving lane','Parking lane')