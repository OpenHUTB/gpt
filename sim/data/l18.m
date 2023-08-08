% 运行仿真并显示车辆在每个时间步长的位置
scenario = drivingScenario('SampleTime',0.1);

roadcenters= [0 0 0; 25 0 0];
road(scenario,roadcenters)

v = vehicle(scenario,'ClassID',1);

waypoints = [5 0 0; 20 0 0];
speed = 20; % m/s
smoothTrajectory(v,waypoints,speed)

plot(scenario)

while advance(scenario)
    fprintf('Vehicle location: %0.2f meters at t = %0.0f ms\n', ...
            v.Position(1), ...
            scenario.SimulationTime * 1000)
end