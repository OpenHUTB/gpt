% 创建含有三条单向车道的道路，车道宽为5.2
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(3,"width",[5.2 5.2 5.2]);
road(scenario,roadCenters,'Lanes',laneSpecification);