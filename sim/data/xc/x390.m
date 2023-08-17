% 在完成左转弯后，车辆在交叉路口倒车。然后，车辆再次转换方向并向前行驶，直到停在与起始位置相反的车道上
scenario = drivingScenario;
road(scenario,[0 -25; 0 25],'lanes',lanespec([1 1]));
road(scenario,[-25 0; 25 0],'lanes',lanespec([1 1]));

turningCar = vehicle(scenario,'ClassID',1);

waypoints = [-20 -2; -5 -2; 2 5; 2 20; 2 5; 5 2; -20 2];
speed = [6 5 5 0 -2 0 5];
yaw =  [0 0 90 90 -90 0 -180];
smoothTrajectory(turningCar,waypoints,speed,'Yaw',yaw)

plot(scenario,'Waypoints','on')

while advance(scenario)
    pause(0.001)
end