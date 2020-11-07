function actionImage = ActionShot(images)
% ActionShot.m creates an actio shot by finding the pixels from a stack of
% images that are most distant from the median RGB values.
% Input: images = a 1xn cell array containing n images where each image is
%                 a RGB image
% Output: actionImage = an action shot in the form of an RGB image
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

% Calculates median RGB values of each pixel in the array

% Note: MedianPixel.m is not used because that function only calculates the
% median RGB values of one pixel and the following code calculates the
% median RGB values of all the pixels in the image set
medianRGB = round(median(imagesArray,2));

% Reshapes the array and repeats the column of median values so the array
% has the same dimensions as imagesArray. Using repmat to repeat the column
% array one time in the vertical direction and length(images) times in the
% horizontal direction
medians = repmat(reshape(medianRGB,pixelNumber,1,3),1,imageNumber);

% Calculates distance between each pixel and median

% Note: MostDistantPixel.m is not used because that function only
% calculates the most distant pixel for one pixel and the following code
% calculates the most distant pixel for each pixel in the images array

% imagesArray and medians are converted from unsigned 8-bit integers to
% doubles for the distance calculation. New variables are used for speed
% since the data type changes
p = double(imagesArray);
q = double(medians);

% Note: PixelDistance.m is not used because that function only calculates
% the squared distance between two points whereas the following code
% calculates the squared distance between two points in two arrays
distances = sum((p-q).^2,3);

% Calculates column number of most distant pixel in each row and then
% converts to a linear index
[~,col] = max(distances,[],2);
index = (col-1)*pixelNumber + (1:pixelNumber)';

% Creates an array of the most distant pixels by finding the pixel in each
% colour layer with the index of the most distant pixel
reds = imagesArray(:,:,1);
greens = imagesArray(:,:,2);
blues = imagesArray(:,:,3);
distantRGB = cat(3, reds(index), greens(index), blues(index));

% Sets the action image to the most distant RGB values array reshaped
% into the original image dimesnions where the values are unsigned 8-bit
% integers
actionImage = uint8(reshape(distantRGB,rows,cols,3));

end
