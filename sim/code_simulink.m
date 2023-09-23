% 生成城市驾驶场景
% 自己导出的场景
dbclear if error
fname = 'auto_created_model';
close_system(fname, 0)
h = new_system(fname);

%% 添加模块
% 要获取库模块路径，可以将鼠标悬停在库浏览器中的模块上
add_block('drivingsim3d/Simulation 3D Scene Configuration', 'auto_created_model/test');

% 获取三维场景配置模块的对话框参数列表。
% dialog_params = get_param('auto_created_model/test', 'DialogParameters');

% set_param('auto_created_model/test', 'SceneDesc', 'US city block');
set_param('auto_created_model/test', 'ProjectFormat', 'Unreal Executable');

set_param('auto_created_model/test', 'ProjectName', fullfile(fileparts(mfilename("fullpath")), 'WindowsNoEditor', 'AutoVrtlEnv.exe'));  % Scene view— 配置显示场景的虚拟摄像机的放置

% 参考 D:\project\AutoVrtlEnv\Content\Maps\USHighway.umap 中的名字
set_param('auto_created_model/test', 'ScenePath', '/Game/Maps/USCityBlock');

%% 开始仿真
% 启动exe的地方：D:\work\matlab\toolbox\shared\sim3d\sim3d\+sim3d\+engine\EngineWin64.m
sim(fname);

% 将文件在当前文件夹中保存为.slx文件
% save_system(fname);

%  0 表示关闭而不保存
close_system(fname, 0)
