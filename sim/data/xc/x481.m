% 创建一个驾驶场景,将场景的停止时间设置为 3 秒
scenario = drivingScenario('StopTime',3)
% 在场景中增加一条双车道公路
roadCenters = [0 1 0; 53 1 0];
laneSpecification = lanespec([1 1]);
road(scenario,roadCenters,'Lanes',laneSpecification);
% 添加另一条道路，与第一条道路成直角相交，形成 T 形, 位置为[20 38.4 0; 20 3 0]
roadCenters = [20 38.4 0; 20 3 0];
laneSpecification = lanespec(2);
road(scenario,roadCenters,'Lanes',laneSpecification)
% 将ego飞行器添加到场景中并定义其航点。将ego车辆的速度设为 20 米/秒，并为自我车辆生成轨迹
egoVehicle = vehicle(scenario,'ClassID',1, ...
                    'Position',[1.5 2.5 0]);
waypoints = [2 3 0; 13 3 0;
            21 3 0; 31 3 0;
            43 3 0; 47 3 0];
speed = 20;
smoothTrajectory(egoVehicle,waypoints,speed)
% 在场景中添加一辆non-ego车辆。通过指定进入时间和退出时间的矢量，设置non-ego车辆在模拟过程中生成和解散两次
% 请注意，每个进入时间值都小于相应的退出时间值
nonEgovehicle1 = vehicle(scenario,'ClassID',1, ...
                'Position',[22 30 0],'EntryTime',[0.2 1.4],'ExitTime',[1.0 2.0]);
% 为non-ego飞行器定义航点。将non-ego车辆的速度设为 30 米/秒，并生成其轨迹
waypoints = [22 35 0; 22 23 0;
            22 13 0; 22 7 0;
            18 -0.3 0; 12 -0.8 0; 5 -0.8 0];
speed = 30;
smoothTrajectory(nonEgovehicle1,waypoints,speed)
% 在场景中添加另一辆non-ego车辆。通过指定正标量的进入时间，将第二辆non-ego车辆设置为在模拟过程中产生一次。
% 由于没有指定退出时间，该车辆将一直留在场景中，直至场景结束
nonEgovehicle2 = vehicle(scenario,'ClassID',1, ...
                'Position',[48 -1 0],'EntryTime',2);
% 为第二个non-ego飞行器定义航点。将车辆速度设为 50 米/秒，并生成其轨迹
waypoints = [48 -1 0; 42 -1 0; 28 -1 0;
            16 -1 0; 12 -1 0];
speed = 50;
smoothTrajectory(nonEgovehicle2,waypoints,speed)
% 创建自定义图形窗口，绘制场景图
fig = figure;
set(fig,'Position',[0 0 600 600])
movegui(fig,'center')
hViewPnl = uipanel(fig,'Position',[0 0 1 1],'Title','Vehicle Spawn and Despawn');
hPlt = axes(hViewPnl);
% 绘制场景图并运行模拟。在模拟运行时，观察场景中的非目标车辆是如何产生和消失的
plot(scenario,'Waypoints','on','Parent',hPlt)
while advance(scenario)
    pause(0.1)
end