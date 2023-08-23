% 沿着半径为550米的圆弧，使用道路中心点创建弯曲的道路。弧开始于10°，结束于150°，并以10°的增量采样，路宽为12,在道路上创建一辆车
scenario = drivingScenario("SampleTime",0.1);
angs = [10:10:150]';
R = 550;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 12;
cr = road(scenario,roadcenters,roadwidth);
Car = vehicle(scenario,'ClassID',1,'Position',[0 550 0]);
plot(scenario)