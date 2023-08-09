
%% 环境配置
ue_proj_dir = "D:\project";
project_name="AutoVrtlEnv";

addpath(fullfile(toolboxdir('shared'), 'sim3d', 'sim3d'))
rehash toolboxcache

%% 工程拷贝

% 将支持包文件拷贝到目的文件夹
% 要确保虚幻引擎中的插件目录"C:\Program Files\Epic Games\UE_4.26\Engine\Plugins\MathWorks"之前没有，否则直接报错"断言失败"
% 原始工程位于：fullfile(matlabshared.supportpkg.getSupportPackageRoot(),"toolbox","shared","sim3dprojects","spkg")
sim3d.utils.copyExampleSim3dProject(ue_proj_dir, VerboseOutput=true)


%% 导出成可执行文件
% 从matlab中打开虚幻引擎工程
path = fullfile(ue_proj_dir, project_name, 'AutoVrtlEnv.uproject');
editor = sim3d.Editor(path);
open(editor);

% 参数配置
% 参考：https://ww2.mathworks.cn/help/releases/R2022b/driving/ug/package-custom-scenes-into-executable.html
% https://docs.unrealengine.com/4.26/zh-CN/SharingAndReleasing/PixelStreaming/PixelStreamingIntro/


