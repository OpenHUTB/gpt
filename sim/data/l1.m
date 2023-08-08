% 沿着半径为800米的圆弧，使用道路中心点创建弯曲的道路。弧开始于0°，结束于90°，并以5°的增量采样
angs = '[0:5:90]';
R = 800;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 10;
cr = road(scenario,roadcenters,roadwidth);