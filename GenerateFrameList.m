function frameList = GenerateFrameList(start, step, n)
% GenerateFrameList.m generates a list of frames which can be used by other
% functions. In particular, it will be useful for determining hich frames
% to extract from a movie file.
% Inputs: start = starting frame number
%         step = step size
%         n = number of frames to generate
% Output: frames = 1xn array containing frame numbers of frames generated
% Author: Aimee Lin

% Preallocates frameList array
frameList = zeros(1,n);

% Generates starting frame number
frameList(1) = start;

% Generates remaining frame numbers
for i = 2:n
    frameList(i) = frameList(i-1) + step;
end

end