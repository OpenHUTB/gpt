

% 需要递归的方式克隆整个项目 git clone <repository> --recursive
% 更新子模块 git submodule update 
addpath(genpath(fullfile(fileparts(pwd), 'utils')));

m_files = RangTraversal('data');

% instruction_list;
instruction_list = {};
for i = 1 : numel(m_files)
    cur_m_file = m_files{i};

    instruction_list = [instruction_list, m2json(cur_m_file)] ;

end

% PrettyPrint 添加缩进，指定为 true 或 false。MATLAB 显示缩进两个空格的 JSON 文本。
out_str = jsonencode(instruction_list, PrettyPrint=true);
out_str = strrep(out_str,'\n','n');
writelines(out_str, fullfile(fileparts(pwd), 'webui', 'data', 'scenario_generation810.json'));

