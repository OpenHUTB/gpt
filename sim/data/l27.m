% 沿着半径为950米的圆弧，使用道路中心点创建弯曲的道路。弧开始于0°，结束于150°，并以10°的增量采样，路宽为2
angs = '[0:10:150]';
R = 950;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))];
roadwidth = 2;
cr = road(scenario,roadcenters,roadwidth);