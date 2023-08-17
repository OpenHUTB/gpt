% 创建一个驾驶场景，车辆以每秒 19 米的速度在 25 米长的笔直道路上行驶。绘制场景图
scenario = drivingScenario('SampleTime',0.1);

roadcenters= [0 0 0; 25 0 0];
road(scenario,roadcenters)
v = vehicle(scenario,'ClassID',1);

waypoints = [5 0 0; 20 0 0];
speed = 19; % m/s
smoothTrajectory(v,waypoints,speed)

plot(scenario)
% 运行模拟并显示车辆在每个时间步的位置
while advance(scenario)
    fprintf('Vehicle location: %0.2f meters at t = %0.0f ms\n', ...
            v.Position(1), ...
            scenario.SimulationTime * 1000)
end
