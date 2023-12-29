% 创建一个由两条相交的直线道路组成的驾驶场景
% 第一条道路长 45 米。第二段直路长 32 米，两边都有护栏，与第一段路相交。
% 一辆汽车以每秒 11.0 米的速度沿第一条道路行驶，以每秒 2.0 米的速度接近一名正在穿过交叉路口的行人。
scenario = drivingScenario('SampleTime',0.1,'StopTime',1);
road1 = road(scenario,[-10 0 0; 45 -20 0]);
road2 = road(scenario,[-10 -10 0; 35 10 0]);
barrier(scenario,road1)
barrier(scenario,road1,'RoadEdge','left')
ped = actor(scenario,'ClassID',4,'Length',0.4,'Width',0.6,'Height',1.7);
car = vehicle(scenario,'ClassID',1);
pedspeed = 2.0;
carspeed = 11.0;
smoothTrajectory(ped,[15 -3 0; 15 3 0],pedspeed);
smoothTrajectory(car,[-10 -10 0; 35 10 0],carspeed);

chasePlot(car,'Centerline','on')

bepPlot = birdsEyePlot('XLim',[-50 50],'YLim',[-40 40]);
outlineplotter = outlinePlotter(bepPlot);
laneplotter = laneBoundaryPlotter(bepPlot);
legend('off')

while advance(scenario)
    rb = roadBoundaries(car);
    [position,yaw,length,width,originOffset,color] = targetOutlines(car);
    [bposition,byaw,blength,bwidth,boriginOffset,bcolor,barrierSegments] = targetOutlines(car,'Barriers');
    plotLaneBoundary(laneplotter,rb)
    plotOutline(outlineplotter,position,yaw,length,width, ...
        'OriginOffset',originOffset,'Color',color)
    plotBarrierOutline(outlineplotter,barrierSegments,bposition,byaw,blength,bwidth, ...
        'OriginOffset',boriginOffset,'Color',bcolor)
    pause(0.01)
end