%道路中心坐标[-50 50 0; -50 -50 0; 0 0 0]
scenario = drivingScenario;
roadCenters = [-50 50 0; -50 -50 0; 0 0 0];

%建立道路
%4车道 实线-虚线-黄色双实线-虚线-实线  
solidW = laneMarking('Solid','Width',0.3);
dashW = laneMarking('Dashed','Space',5);
doubleY = laneMarking('DoubleSolid','Color','yellow');
lspec = lanespec([2 2],'Width',[5 5 5 5], ...
    'Marking',[solidW dashW doubleY dashW solidW]);
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

%交通车信息
obs = struct;
obs(1).vehicle = [];
obs(1).waypoints = rightWaypoints(50:end,:);
obs(1).pos = obs(1).waypoints(1,:);
obs(1).speed = 10;
 
%%在场景添加车辆
%根据自车信息添加车辆
ego.vehicle = vehicle(scenario,'Position',ego.pos);
trajectory(ego.vehicle,ego.waypoints,ego.speed);
%根据交通车信息添加车辆
obs(1).vehicle = vehicle(scenario,'Position',obs(1).pos);
trajectory(obs(1).vehicle,obs(1).waypoints,obs(1).speed);

% 展示场景
plot(scenario);