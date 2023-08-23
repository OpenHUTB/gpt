% 用默认宽度添加两条直线道路，两端使用道路中心点。在第一条笔直的道路右侧加护栏，在两条路上都创建一辆车
scenario = drivingScenario("SampleTime",0.5);
roadcenters = [700 0 0; 100 0 0];
sr1 = road(scenario,roadcenters);
barrier(scenario,sr1)
roadcenters = [400 400 0; 0 0 0];
road(scenario,roadcenters);
v1 = vehicle(scenario,"ClassID",1,"Position",[0 0 0]);
v2 = vehicle(scenario,"ClassID",1,"Position",[100 0 0]);
plot(scenario)