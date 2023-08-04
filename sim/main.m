%% 通过文本获得代码
% 获得python可执行文件的路径
proj_dir = fileparts(fileparts(mfilename("fullpath")));
py_path = fullfile(proj_dir, ...
    'webui', 'python', 'python.exe');
py_script_path = fullfile(proj_dir, 'webui', 'training_wizardcoder_mydata.py');
cmd_prefix = [py_path, ' ' py_script_path];

system([cmd_prefix]);



%% 通过代码获得场景
scenario = drivingScenario
v1 = vehicle(scenario,position=[-23.603712367621732 -7.3159775241949647 1.99])


%% 测试用例
scenario = drivingScenario;
roadCenters = [0 0; 30 0];
road(scenario,roadCenters,'Lanes',lanespec(2));
v = vehicle(scenario,'ClassID',1);

% 生成的场景需要能通过驾驶场景设计器打开
% drivingScenarioDesigner(scenario)


%% 
% 解决"现在无法访问以前可访问的文件 Designer.p"的问题
addpath(fullfile(matlabroot, 'toolbox\shared\drivingscenario'));
rehash toolboxcache

% 构建驾驶场景设计器类
designer = driving.internal.scenarioApp.Designer(scenario);
% 启动虚幻引擎场景查看器
designer.getGamingEngineViewer(1, 1);



%% 调用虚幻引擎
% % 参考：toolbox\shared\drivingscenario\+driving\+scenario\+internal\GamingEngineScenarioAnimator.m
% World = sim3d.World(sim3d.engine.Env.AutomotiveExe(), "/Game/Maps/EmptyGrass4k4k"); % EmptyGrass4k4k or BlackLake
% World.start();  % 打开虚幻引擎（黑色）界面






