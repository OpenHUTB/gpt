inputScenario = drivingScenario;
% 将 OpenStreetMap® 道路网络导入驾驶场景
fileName = "chicago.osm";
roadNetwork(inputScenario,"OpenStreetMap",fileName);
% 导出为 ASAM OpenDRIVE® 文件。
fileName = "chicago.xodr";
export(inputScenario,"OpenDRIVE",fileName);
% 使用 roadNetwork 功能读取导出的 ASAM OpenDRIVE 文件
scenario = drivingScenario;
roadNetwork(scenario,"OpenDRIVE",fileName);
% 绘制导出的场景图。，导出的道路网络显示屏沿 x 和 y 轴翻转，没有边框线。
figure
plot(inputScenario)
zoom(2);
title("Actual Scenario")