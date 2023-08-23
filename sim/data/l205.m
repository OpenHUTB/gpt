% 沿着半径为600米的圆弧，使用道路中心点创建弯曲的道路。弧开始于0°，结束于90°，并以4°的增量采样，路宽为6,在道路上创建一辆车
scenario = drivingScenario("SampleTime",0.1);
angs = [0:4:90]';
R = 600;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 6;
cr = road(scenario,roadcenters,roadwidth);
Car = vehicle(scenario,'ClassID',1,'Position',[25 600 0]);
plot(scenario)