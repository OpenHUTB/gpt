% 创建含有三条单向车道的道路，车道宽为4.7
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[4.7 4.7 4.7]);
road(scenario,roadCenters,'Lanes',laneSpecification);