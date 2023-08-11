% 使用道路中心点沿着半径为200米的圆弧创建弯曲道路,弧线起点为 0°，终点为 90°，并以 5°为增量进行采样
scenario = drivingScenario('SampleTime',0.1','StopTime',60);
angs = [0:5:90]';
R = 200;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 10;
cr = road(scenario,roadcenters,roadwidth);

plot(scenario)