%道路中心坐标[-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;-10 10 0; -10 -15 0; -20 -20 0]
scenario = drivingScenario;
roadCenters = [-60 60 0; -80 40 0; -50 45 0; -30 40 0; -60 0 0; -20 10 0;
    -10 10 0; -10 -15 0; -20 -20 0];

%建立道路
%分界线线型 实线 虚线 实线  
marking = [laneMarking('Solid') ...
    laneMarking('Dashed') laneMarking('Solid')];
%道路规范 两条车道+分界线线型
laneSpecification = lanespec(2, "marking", marking);
%生成道路
road(scenario, roadCenters, 'Lanes', laneSpecification);

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

%1号交通车信息
obs = struct;
obs(1).vehicle = [];
obs(1).waypoints = rightWaypoints(50:end,:);
obs(1).pos = obs(1).waypoints(1,:);
obs(1).speed = 10;
 
%2号交通车信息
obs(2).vehicle = [];
obs(2).waypoints = leftWaypoints(30:end,:);
obs(2).pos = obs(2).waypoints(1,:);
obs(2).speed = 8;

%%在场景添加车辆
%根据自车信息添加车辆
ego.vehicle = vehicle(scenario,'Position',ego.pos);
trajectory(ego.vehicle,ego.waypoints,ego.speed);
 
%根据交通车信息添加车辆
for i = 1:2
    obs(i).vehicle = vehicle(scenario,'Position',obs(i).pos);
    trajectory(obs(i).vehicle,obs(i).waypoints,obs(i).speed);
end

% 展示场景
plot(scenario);