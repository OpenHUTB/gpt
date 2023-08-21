%道路中心坐标[-60 60 0; -80 -5 0; -30 30 0; -10 40 0; 0 0 0; -20 -20 0]
scenario = drivingScenario;
roadCenters = [-60 60 0; -80 -5 0; -30 30 0; -10 40 0; 0 0 0; -20 -20 0];

%建立道路
%2车道 实线-黄色双虚线-实线  
solidW = laneMarking('Solid','Width',0.3);
doubleY = laneMarking('DoubleDashed','Color','yellow');
lspec = lanespec(2,'Marking',[solidW doubleY solidW]);
%生成道路
road(scenario, roadCenters, 'Lanes', lspec);

%获得道路边界，把边界点位置重新整理次序
rdbdy = roadBoundaries(scenario);
rdbdy = rdbdy{1, 1}(1:end-1,:);
rdbdy = [rdbdy(3:end,:); rdbdy(1:2,:)];
rdbdy(1,3) = 0;

%%构建车辆信息
%根据单向两车道约定，分别计算左车道和右车道中心线坐标，以生成车辆航迹点
ptNums = size(rdbdy,1);
for j = 1:ptNums/2  %道路两侧的道路散点数量总共为ptNums，故ptNums/2为一侧的散点数量
    rightBdyPt = rdbdy(j,:);
    leftBdyPt = rdbdy(ptNums-j+1,:);
    leftWaypoints(j,:) = leftBdyPt + (rightBdyPt - leftBdyPt)*0.25;%左车道和右车道中心线坐标
    rightWaypoints(j,:) = leftBdyPt + (rightBdyPt - leftBdyPt)*0.75;
end

%本车信息
ego.vehicle = [];
ego.waypoints = rightWaypoints; %航迹点
ego.pos = ego.waypoints(1,:); %初始位置 
ego.speed = 15; %速度

%%在场景添加车辆
%根据自车信息添加车辆
ego.vehicle = vehicle(scenario,'Position',ego.pos);
trajectory(ego.vehicle,ego.waypoints,ego.speed);

% 展示场景
plot(scenario);