function main(exe_dir)
% 参数exe_path指向导出的可执行场景所在的路径
% 运行示例，本服务器地址：main('C:\Users\Administrator\Desktop\WorkPlace\DaoBao\WindowsNoEditor')
% exe_path = "C:\Users\Administrator\Desktop\WorkPlace\DaoBao\WindowsNoEditor\XianJia.exe -AudioMixer -PixelStreamingIP=localhost -PixelStreamingPort=8888";

% TODO：启动虚幻引擎信令服务
exe_path = fullfile(exe_dir, 'XianJia.exe');
signalling_server_path = fullfile(exe_dir, 'Engine', 'Source', 'Programs', ...
    'PixelStreaming', 'WebServers', 'SignallingWebServer', 'run.bat');
system([signalling_server_path ' &']);  % 后台执行

pause(3);

%% 调用虚幻引擎
% % 参考：toolbox\shared\drivingscenario\+driving\+scenario\+internal\GamingEngineScenarioAnimator.m
% World = sim3d.World(sim3d.engine.Env.AutomotiveExe(), "/Game/Maps/EmptyGrass4k4k"); % EmptyGrass4k4k or BlackLake
% World.start();  % 打开虚幻引擎（黑色）界面

% matlab\toolbox\shared\sim3d\sim3d\+sim3d\+engine -> AutomotiveExe()
% 原来的path路径是：matlab\toolbox\shared\sim3d_projects\automotive_project
% 自定义的是：D:\project\EmptyGrass4k4k\WindowsNoEditor
% getpref('Simulation3D', 'UnrealPath');


% 用于像素流转发
ExecCmds = " -AudioMixer -PixelStreamingIP=localhost -PixelStreamingPort=8888";
setpref('Simulation3D', 'ExecCmds', ExecCmds)

% ExecutablePath' 的值必须满足函数: @(x)isstring(x)||isempty(x)
setpref('Simulation3D', 'UnrealPath', exe_path)

% rmpref('Simulation3D', 'UnrealPath')


%% 通过文本获得代码
% 获得python可执行文件的路径
% proj_dir = fileparts(fileparts(mfilename("fullpath")));
% py_path = fullfile(proj_dir, ...
%     'webui', 'python', 'python.exe');
% py_script_path = fullfile(proj_dir, 'webui', 'training_wizardcoder_mydata.py');
% cmd_prefix = [py_path, ' ' py_script_path];
% 
% system([cmd_prefix]);


%% 通过代码获得场景
% scenario = drivingScenario
% v1 = vehicle(scenario, position=[-23.603712367621732 -7.3159775241949647 1.99])


%% 通过代码获得场景的测试用例
run('./code.m');


% 生成的场景需要能通过驾驶场景设计器打开
% drivingScenarioDesigner(scenario)


% 解决"现在无法访问以前可访问的文件 Designer.p"的问题
% addpath(fullfile(matlabroot, 'toolbox\shared\drivingscenario'));
% rehash toolboxcache

% 构建驾驶场景设计器类
designer = driving.internal.scenarioApp.Designer(scenario);
% 打开图形界面
% designer.open()
% designer.getTitle();

% 启动虚幻引擎场景查看器
ue_viewer = designer.getGamingEngineViewer(1, 1);
% ue_viewer.start();  % 开始仿真（失败）

% 开始仿真（相当于点击驾驶场景设计器菜单中的运行）
designer.Simulator.run()

% 使用自带浏览器查看：127.0.0.1

% ue_viewer.delete()  % 关闭虚幻引擎场景查看器（成功）
end











