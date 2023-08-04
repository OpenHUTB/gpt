

fid = fopen('data\test.m');

fstr = '';

line_num = 0;
while ~feof(fid)
    tline = fgets(fid);  % 读入一行（包括换行）
    line_num = line_num + 1;
    if line_num == 1
        continue;
    end
    fstr = strcat(fstr, tline, '\n');
end

fclose(fid);

% json_str = jsonencode(fstr)

disp(fstr);