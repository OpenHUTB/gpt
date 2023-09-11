% 生成半夜的场景
fname = 'auto_created_model';
h = new_system(fname);

% 要获取库模块路径，可以将鼠标悬停在库浏览器中的模块上
add_block('drivingsim3d/Simulation 3D Scene Configuration', 'auto_created_model/test');


% 获取三维场景配置模块的对话框参数列表。
% dialog_params = get_param('auto_created_model/test', 'DialogParameters');

set_param('auto_created_model/test', 'EnableWeather', 'on');
set_param('auto_created_model/test', 'SunAltitude', '-90');
set_param('auto_created_model/test', 'SunAzimuth', '180');

sim(fname);

% 将文件在当前文件夹中保存为.slx文件
% save_system(fname);

%  0 表示关闭而不保存
close_system(fname, 0)