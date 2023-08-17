% 生成一个十字路口，车辆在进入弯道时从每秒 6 米的速度减速到每秒 5 米。完成转弯后，车辆又加速回到原来的速度
scenario = drivingScenario;
road(scenario,[0 -25; 0 25],'lanes',lanespec([1 1]));
road(scenario,[-25 0; 25 0],'lanes',lanespec([1 1]));

turningCar = vehicle(scenario,'ClassID',1);

waypoints = [-20 -2; -5 -2; 2 5; 2 20];
speed = [6 5 5 6];
yaw = [0 0 90 90];
smoothTrajectory(turningCar,waypoints,speed,'Yaw',yaw)

plot(scenario,'Waypoints','on')

while advance(scenario)
    pause(0.01)
end