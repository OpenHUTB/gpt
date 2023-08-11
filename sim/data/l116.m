% 创建含有三条单向车道的道路，车道宽为4.6
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[4.6 4.6 4.6]);
road(scenario,roadCenters,'Lanes',laneSpecification);