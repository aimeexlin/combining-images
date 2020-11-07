function staticImage = RemoveAction(images)
% RemoveAction.m creates an image that has the action removed by applying a
% median filter.
% Input: images = a 1xn cell array containing n images where each image is
%                 a RGB image
% Output: staticImage = a RGB image obtained by taking the median RGB
%                       values of the stack of corresponding pixels from
%                       the source images
% Author: Aimee Lin

% Finds size of the image (assuming all images in the set are the same size)
[rows, cols,~] = size(images{1});
pixelNumber = rows*cols;
imageNumber = length(images);

% Creates an array of the RGB values of the images in the set by reshaping
% the arrays for each image into a new array using cell2mat to
% convert the images cell array to a matrix and using reshape combine rows
% and columns into one dimension to make vectorisation easier
imagesArray = reshape(cell2mat(images),pixelNumber,imageNumber,3);

% Calculates median values of each pixel in the array

% Note: MedianPixel.m is not used because that function only calculates the
% median RGB values of one pixel and the following code calculates the
% median RGB values of all the pixels in the image set
medianRGB = round(median(imagesArray,2));

% Sets the static image to the median RGB values array reshaped into the
% original image dimesnions where the values are unsigned 8-bit integers
staticImage = uint8(reshape(medianRGB,rows,cols,3));

end