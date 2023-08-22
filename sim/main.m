function main(varargin)
% 参数exe_path指向导出的可执行场景所在的路径
% 将可执行场景放到WindowsNoEditor目录下，传入默认参数：main()
% 运行草地场景：main('C:\Buffer\gpt\WindowsNoEditor\AutoVrtlEnv.exe')
% 运行草地场景：main('D:\project\EmptyGrass4k4k\WindowsNoEditor\AutoVrtlEnv.exe')
% 运行自定义场景：main('C:\Users\Administrator\Desktop\WorkPlace\DaoBao\WindowsNoEditor\XianJia.exe')

% 常见问题：
% 没有启动图形界面，只有数据发送：找不到exe文件

% todo: 虚幻引擎启动时候过长，已经无响应了，需要杀死进程重新启动
% 有时候启动没有道路
% 去掉网页的两次点击

if nargin < 1
    exe_path = 'WindowsNoEditor\AutoVrtlEnv.exe';
else
    exe_path = varargin{1};
end

% 初始化环境
% 如果有dbstop if error则运行报错
dbclear if error


%% 杀死之前已有的进程
% proj_dir = fileparts(fileparts(mfilename('fullpath')));
% addpath(fullfile(proj_dir, 'utils'));
[~,cmdout] = system('tasklist');

cmdout = split(cmdout,strcat(10));
WINWORD = cmdout(contains(cmdout, 'node.exe'),:);
if isempty(WINWORD)  % 进程不存在则启动，不需要杀
    exe_dir = fileparts(exe_path);
    signalling_server_path = fullfile(exe_dir, 'Engine', 'Source', 'Programs', ...
        'PixelStreaming', 'WebServers', 'SignallingWebServer', 'run.bat');
    system([signalling_server_path ' &']);  % 后台执行

    pause(3);
    % 杀死之前存在的信令服务
    % kill_process('node.exe');
    % kill_process('cmd.exe');
end

% todo: 存在node.exe就不再启动了
% 杀死之前的循环引擎服务
% kill_process('AutoVrtlEnv.exe');
WINWORD = cmdout(contains(cmdout, 'AutoVrtlEnv.exe'),:);
for i = 1 : numel(WINWORD)
    cur_process = WINWORD{i};
    cur_process_info = split( cur_process,' ');
    % 杀死指定进程
    system(strcat('taskkill /pid' , 32 , cur_process_info{ find( ismember( cur_process_info, 'Console' ) , 1 ) - 1 } , 32 , ' /f' ) );
end


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
% 如果不出现，则调试 D:\work\matlab\toolbox\shared\drivingscenario\+driving\+scenario\+internal\GamingEngineScenarioAnimator.m
% 中的 setupCommandReaderAndWriter() 和 setup(this) 方法
ue_viewer = designer.getGamingEngineViewer(1, 1);


% 开始仿真（相当于点击驾驶场景设计器菜单中的运行）
% sim_start_time = cputime
% matlab\toolbox\shared\drivingscenario\+driving\+internal\+scenarioApp\Display.m
% 有属性Simulator
% matlab\toolbox\shared\drivingscenario\+driving\+internal\+scenarioApp\Simulator.m
% 有方法run()
designer.Simulator.run()

% 使用自带浏览器查看：127.0.0.1

%% 清除环境
% pause(3);
% ue_viewer.delete()  % 关闭虚幻引擎场景查看器（成功）
rmpref('Simulation3D', 'UnrealPath')

end

