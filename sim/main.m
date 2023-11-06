function main(varargin)
% 参数exe_path指向导出的可执行场景所在的路径
% 将可执行场景放到WindowsNoEditor目录下，传入默认参数：main()
% 运行草地场景：main('C:\Buffer\gpt\WindowsNoEditor\AutoVrtlEnv.exe')
% 运行草地场景：main('D:\project\EmptyGrass4k4k\WindowsNoEditor\AutoVrtlEnv.exe')
% 运行自定义场景：main('C:\Users\Administrator\Desktop\WorkPlace\DaoBao\WindowsNoEditor\XianJia.exe')
% 运行湖工商场景：main('D:\project\HutbCity\WindowsNoEditor\AutoVrtlEnv.exe')

run(fullfile(fileparts(mfilename('fullpath')), "prepare_env.m"));

src_code_path = fullfile(fileparts(mfilename('fullpath')), 'code.m');
run(src_code_path);

if exist("scenario", 'var')
    if isempty(varargin)
        run_scenario(scenario);
    else
        run_scenario(scenario, varargin);
    end
end

end

