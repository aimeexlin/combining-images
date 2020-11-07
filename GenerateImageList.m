function imageList = GenerateImageList(directory,file)
% GenerateImageList.m generates a list of all the images in a specific
% directory with a particular file extension.
% Inputs: directory = a string containing the name of the directory the
%                     images are contained in
%         file = a string containign the file extension of the images to
%                fetch
% Output: imageList = a 1xn cell array containing filenames of images from the
%                     specicified directory with a particular file extension
% Author: Aimee Lin

% Sets up structure array for specified directory
structure = dir(directory);

% Finds size of structure array to preallocate imageList
% ~ is used here to ignore the columns output argument as it is not needed
% for this function
[rows,~] = size(structure);

% Preallocates imageList (we do not yet know how many files in the
% directory will be the specified file type  and how many hidden files
% there are so we can only preallocate for the maximum possible number,
% which is the total number of files in the directory)
imageList = cell(1,rows);

% Generates a list of images in directory with specicified file extension
% that are not hidden files
i = 1;
for j = 1:rows
    % ~isempty(strfind(structure(j).name, file)) checks for the specified
    % file extension (using ~isempty for optimisation as recommended by MATLAB)
    % isempty(strfind(structure(j).name, '._')) checks for hidden files
    if ~isempty(strfind(structure(j).name, strcat({'.'},file))) && isempty(strfind(structure(j).name, '._'))
        imageList{i} = structure(j).name;
        i = i + 1;
    end
end

% Removes empty elements from imageList (since not all of the files in the
% directory are the specified file type and some are hidden files, we would
% have preallocated for more elements than there are in the cell array so
% there will be empty elements)

% Retrieved from https://au.mathworks.com/matlabcentral/answers/363459-removing-a-blank-string-from-a-cell-array
imageList(cellfun('isempty', imageList)) = [];

end






