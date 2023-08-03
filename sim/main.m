
% 获得python可执行文件的路径
proj_dir = fileparts(fileparts(mfilename("fullpath")));
py_path = fullfile(proj_dir, ...
    'webui', 'python', 'python.exe');
py_script_path = fullfile(proj_dir, 'webui', 'training_wizardcoder_mydata.py');
cmd_prefix = [py_path, ' ' py_script_path];

system([cmd_prefix]); 