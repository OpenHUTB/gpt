function s = m2json(m_path)

fid = fopen(m_path);

instruction_str = '';
fstr = '';

line_num = 0;
while ~feof(fid)
    tline = fgets(fid);  % 读入一行（包括换行）
    line_num = line_num + 1;
    if line_num == 1
        tline = tline(2:end);  % 移除注释的%
        tline = strtrim(tline);  % 移除前后空格
        instruction_str = tline;  % 获取指令
        continue;
    end
    fstr = strcat(fstr, tline, "\n");
end

fclose(fid);

s.instruction = instruction_str;
s.input = "";
s.output = fstr;

end



