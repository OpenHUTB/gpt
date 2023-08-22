%创建一条三条道变两条道的道路
scenario = drivingScenario;

roadCenters = [0 0; 50 0];

% Define an array of lane specifications for two one-way road segments.
% Notice that one lane drops in the second road segment.
lsArray = [lanespec(3) lanespec(2)];

% Define a road segment connector object. Specify position to drop a lane
% and taper length.
lc = laneSpecConnector('Position','Left','TaperLength',30);

% Combine lane specifications of road segments.
clspec = compositeLaneSpec(lsArray,'Connector',lc);

road(scenario,roadCenters,'lanes',clspec);