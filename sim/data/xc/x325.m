% 将 ASAM OpenDRIVE 道路导入场景。将 "ShowLaneTypes"（显示车道类型）值设为 false，以抑制多种车道类型。
% 该函数会忽略车道类型信息，并将所有车道导入为行车道
scenario = drivingScenario;
roadNetwork(scenario,'OpenDRIVE',filePath,'ShowLaneTypes',false);
plot(scenario)
% 放大系数为2.1
zoom(2.1)