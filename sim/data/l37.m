% 创建含有两条单向车道的道路，车道宽为4
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(2,"width",[4 4]);
road(scenario,roadCenters,'Lanes',laneSpecification);