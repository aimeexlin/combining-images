function images = ReadImages(directory,imageList)
% ReadImages.m reads in a specified list of images given the filenames and
% the directory the files are located in.
% Inputs: directory = a string containing the name of the directory the
%                     images are contained in
%         imageList = a 1xn cell array containing filenames of images from the
%                     specicified directory to read
% Output: images = a 1xn cell array containing n images where each image is
%                  a RGB image
% Author: Aimee Lin

% Preallocates cell array for images
images = cell(1,length(imageList));

for i = 1:length(imageList)
    % Reads the image with file name of directory and file concatenated
    % using strcat
    images{i} = imread(char(strcat(directory,{'/'},imageList{i})));
end

end