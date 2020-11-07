function [medianR, medianG, medianB] = MedianPixel(pixels)
% MedianPixel.m calculates the median RGB values from a list of pixels.
% Input: pixels = a 1xnx3 array of RGB values representing a list of
%                 pixels
% Outputs: medianRed = median red value
%          medianGreen = median green value
%          medianBlue = median blue value
% Author: Aimee Lin

% Calculates median red value rounded to nearest whole number
medianR = round(median(pixels(:,:,1)));

% Calculates median green value rounded to nearest whole number
medianG = round(median(pixels(:,:,2)));

% Calculates median blue value rounded to nearest whole number
medianB = round(median(pixels(:,:,3)));

end
