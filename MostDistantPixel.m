function [distantR, distantG, distantB] = MostDistantPixel(pixels)
% MostDistantPixel.m calculates the pixel from a list that is most distant
% from the median RGB values of the list using the PixelDistance function.
% Input: pixels = a 1xnx3 array of RGB values representing a list of
%                 pixels
% Outputs: distantR = red value of the most distant pixel
%          distantG = green value of the most distant pixel
%          distantB = blue value of the most distant pixel
% Author: Aimee Lin

% Checks if there is only one pixel (if there is only one pixel it must
% be the most distant pixel)
[~,n,~] = size(pixels);
if n == 1
    % Sets values for the most distant pixel
    distantR = pixels(:,:,1);
    distantG = pixels(:,:,2);
    distantB = pixels(:,:,3);
else
    % Preallocates d
    % d is a 1xn array of distances between the pixel and the median pixel
    % where n is the number of pixels
    d = zeros(1,n);
    % Calculates pixel distance for each pixel in the list of pixels using
    % reshape to make the two pixels we are comparing with PixelDistance.m
    % the same dimensions (1x3)
    for i = 1:n
        [medianR, medianG, medianB] = MedianPixel(pixels);
        d(1,i) = PixelDistance(reshape(pixels(1,i,:),1,3),[medianR,medianG,medianB]);
    end
    % Finds the array index of the pixel that is most distant to the
    % median pixel
    % ~ is used to ignore output argument for row as it is not needed
    % index is the array index
    [~,index] = max(d);
    % Sets values for most distant pixel
    distantR = pixels(:,index,1);
    distantG = pixels(:,index,2);
    distantB = pixels(:,index,3);
end

end