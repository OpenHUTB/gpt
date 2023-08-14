% 创建一个包含停车场的驾驶场景
scenario = drivingScenario;
vertices = [0 9; 18 9; 18 -9; 0 -9];
parkingLot(scenario,vertices,ParkingSpace=parkingSpace);
% 创建一辆汽车并确定其行驶轨迹。汽车向前行驶、停止，然后倒车驶入停车位
% 当汽车驶入停车位时，它的偏航方向角与开始时的偏航方向角呈逆时针方向 90 度
car = vehicle(scenario,ClassID=1);
waypoints = [9 -5; 9 5; 6 -1.3; 2 -1.3];
speed = [3; 0; -2; 0];
yaw = [90 90 180 180];
smoothTrajectory(car,waypoints,speed,Yaw=yaw)

plot(scenario,Waypoints="on")
while advance(scenario)
    pause(0.001)
end