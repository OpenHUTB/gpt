% 创建含有两条单向车道的道路，车道宽为默认值
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification);