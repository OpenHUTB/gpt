% 创建一个驾驶场景。使用默认的 0.01 秒采样时间
scenario = drivingScenario;
% 在场景中添加一条 45 米长的笔直道路,道路有两条车道
roadCenters = [0 0; 45 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
% 添加一辆以每秒 30 米的恒定速度在左侧车道行驶的车辆。在运行模拟之前绘制场景图
v = vehicle(scenario,'ClassID',1);
waypoints = [5 2; 25 2];
speed = 30; % m/s
smoothTrajectory(v,waypoints,speed)

plot(scenario)

% 在循环中调用前进函数，每次前进一个时间步。每隔 0.01 秒暂停一次，在曲线图上观察车辆的运动情况
while advance(scenario)
    pause(0.01)
end