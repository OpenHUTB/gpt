%% matlab环境配置
% 完成：
% 1. 将自带工程AutoVrtlEnv工程拷贝到{ue_proj_dir}
% 2. 启用插件
function sim3d_conf(proj_dir)
% 测试：sim3d_conf('C:\Buffer')
%% 环境配置
% proj_dir = "D:\project";
project_name="AutoVrtlEnv";

ue_proj_dir = 'D:\work\matlab\software\UE_4.26\';

addpath(fullfile(toolboxdir('shared'), 'sim3d', 'sim3d'))
rehash toolboxcache

%% 工程拷贝

% 将支持包文件拷贝到目的文件夹
% 要确保虚幻引擎中的插件目录"C:\Program Files\Epic Games\UE_4.26\Engine\Plugins\MathWorks"之前没有，否则直接报错"断言失败"
% 还需要保证Matlab对目录"C:\Program Files\Epic Games\UE_4.26\Engine\Plugins"写入权限（以管理员权限启动matlab）
% 原始工程位于：fullfile(matlabshared.supportpkg.getSupportPackageRoot(),"toolbox","shared","sim3dprojects","spkg")
if ~exist(fullfile(proj_dir, project_name), 'dir')
    sim3d.utils.copyExampleSim3dProject(proj_dir, ...
        VerboseOutput=true, ...
        PluginDestination=fullfile(ue_proj_dir, 'Engine', 'Plugins', 'MathWorks') )
%     sim3d.utils.copyExampleSim3dProject(ue_proj_dir, VerboseOutput=true)
end


%% 导出成可执行文件
% 从matlab中打开虚幻引擎工程
path = fullfile(proj_dir, project_name, 'AutoVrtlEnv.uproject');
editor = sim3d.Editor(path);
open(editor);

% 这个时候通过右键AutoVrtEnv.uproject，选择 Generate Visual Stuudio project files，
% 生成 AutoVrtEnv.sln后可以通过双击打开vs2019。

% 参数配置
% 参考：https://ww2.mathworks.cn/help/releases/R2022b/driving/ug/package-custom-scenes-into-executable.html
% https://docs.unrealengine.com/4.26/zh-CN/SharingAndReleasing/PixelStreaming/PixelStreamingIntro/

% 取消 引擎（Engine） > 输入类型（Input category） 下启用 固定显示触控界面（Always Show Touch Interface） 设置。
% 否则左右各有两个触控界面的圆圈
% 导出目录：D:\work\workspace\gpt\sim
% 覆盖后，然后用git 进行revert

end


