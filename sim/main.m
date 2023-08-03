
% 获得python可执行文件的路径
proj_dir = fileparts(fileparts(mfilename("fullpath")));
py_path = fullfile(proj_dir, ...
    'webui', 'python', 'python.exe');
py_script_path = fullfile(proj_dir, 'webui', 'training_wizardcoder_mydata.py');
cmd_prefix = [py_path, ' ' py_script_path];

%%
scenario = drivingScenario
v1 = vehicle(scenario,position=[-23.603712367621732 -7.3159775241949647 1.99])

%%
system([cmd_prefix]); 




