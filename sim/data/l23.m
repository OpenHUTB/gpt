% 沿着半径为500米的圆弧，使用道路中心点创建弯曲的道路。弧开始于0°，结束于120°，并以6°的增量采样，路宽为4
angs = [0:6:120]';
R = 500;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 4;
cr = road(scenario,roadcenters,roadwidth);