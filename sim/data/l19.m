% 重新启动模拟。增加采样时间为0.2并重新运行模拟。
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

restart(scenario);
scenario.SampleTime = 0.2;

while advance(scenario)
    fprintf('Vehicle location: %0.2f meters at t = %0.0f ms\n', ...
            v.Position(1), ...
            scenario.SimulationTime * 1000)
end