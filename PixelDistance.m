function distance = PixelDistance(p, q)
% PixelDistance.m calculates the square of the distance between two points
% in colour space.
% Inputs: p = an array containing three elements representing a point
%                  in 3D colour space
%         q = an array containing three elements representing a second
%                  point in 3D colour space
% Output: distance = the square of the distance between the two points in
%                    3D colour space
% Author: Aimee Lin 

% Converts p and q into doubles
P = double(p);
Q = double(q);

% Calculates squared distance between p and q
distance = sum((P-Q).^2);

end