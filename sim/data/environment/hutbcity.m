% 生成城市场景，添加一辆匀速运行的车辆
dbclear if error
fname = 'run1';
close_system(fname, 0)
h = new_system(fname);
open_system(fname)

add_block('drivingsim3d/Simulation 3D Vehicle with Ground Following','run1/vehicle1');
% set_param('run1/vehicle1','InitialPos', [-319,1060,90]);
set_param('run1/vehicle1','InitialPos', '[-316.5, 1050, 0]')
set_param('run1/vehicle1','InitialRot', '[0, 0, 90]')



% 要获取库模块路径，可以将鼠标悬停在库浏览器中的模块上
add_block('drivingsim3d/Simulation 3D Scene Configuration', 'run1/test');
set_param('run1/test', 'ProjectFormat', 'Unreal Executable');
set_param('run1/test', 'ProjectName', 'D:\ue\WindowsNoEditor\AutoVrtlEnv.exe');
set_param('run1/test', 'ScenePath', '/Game/Maps/HutbCity');

% param_1 = get_param('run1/test','ObjectParameters')

% 如果在添加任何车辆块之前向模型中 添加“Simulation 3D 场景配置”块，则虚拟摄像机将保持位于场景原点。
% 要重新定位摄像机以跟随车辆，请更新此参数
set_param('run1/test', 'vehTag', 'SimulinkVehicle1');


% set_param('run1/test', 'vehTagList', {'Scene Origin', 'SimulinkVehicle1'});
% set_param('run1/test', 'vehTag', 'Scene Origin');
% pause(3)
% dbstop at 25
% disp("");
% run("set_vehTag.m")


% eval("set_param('run1/test', 'vehTag', 'SimulinkVehicle1')");
% v = evalin('base',"set_param('run1/test', 'vehTag', 'SimulinkVehicle1');");


% param_1 = get_param('run1/test','ObjectParameters')
% get_param('run1/vehicle1','ObjectParameters')

%x

add_block('simulink/Commonly Used Blocks/Constant','run1/Constant1');
set_param('run1/Constant1', 'Value', '-316.5');
set_param('run1/vehicle1','position',[220,80,260,120]);
add_line('run1', 'Constant1/1', 'vehicle1/1')

%y
add_block('simulink/Commonly Used Blocks/Constant','run1/Constant2');
set_param('run1/Constant2', 'Value', '1050');




add_block('simulink/Sources/Digital Clock','run1/DigitalClock1','SampleTime','0.01');

%乘
add_block('simulink/Quick Insert/Math Operations/Multiply','run1/Multiply1', 'Gain', '15');
%加法
add_block('simulink/Math Operations/Add','run1/Add1')
add_line('run1', 'Constant2/1', 'Add1/1');
add_line('run1', 'DigitalClock1/1', 'Multiply1/1')
add_line('run1', 'Multiply1/1', 'Add1/2')
add_line('run1', 'Add1/1', 'vehicle1/2')






add_block('simulink/Commonly Used Blocks/Constant','run1/Constant3');
set_param('run1/Constant3', 'Value', '90');
add_line('run1', 'Constant3/1', 'vehicle1/3')
%distances=get_param()


sim('run1', 'StopTime', '10');