function tf = datasetExists(name)
%datasetExists Check if dataset exists

% Copyright 2021 The MathWorks, Inc.

tf = exist(name,'dir');

if tf
    bytes = folderSize(name);
    tf = tf & bytes~=0;
end

end


function bytes = folderSize(name)
%folderSize Size of folders and all subfolders

% Copyright 2021 The MathWorks, Inc.

listing = dir(name);

bytes = 0;
for idx = 1:numel(listing)
    if ~strcmp(listing(idx).name,'.') && ~strcmp(listing(idx).name,'..')
        bytes = bytes + listing(idx).bytes;
        if listing(idx).isdir
            bytes = bytes + folderSize(fullfile(listing(idx).folder,listing(idx).name));
        end
    end
end
end