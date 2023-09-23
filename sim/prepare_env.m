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
    system([signalling_server_path ' &']);  % 后台执行，如果一闪而过可能是node没有安装

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