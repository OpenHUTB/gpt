

% 需要递归的方式克隆整个项目 git clone <repository> --recursive
% 更新子模块 git submodule update 
addpath(fullfile(fileparts(pwd), 'utils', 'json'));

m_path = 'data\test.m';

s = m2json(m_path);

out_str = jsonencode(s, PrettyPrint=true)