function [energy, grayed] = modifiedEnergy(oImageMat);
%Energy function calculated by adding the squares of the horizontal and
%vertical derivatives.

% convert image to greyscale
grayed = im2gray(oImageMat);
% convolve with [1, -1] for x gradient, remove extra column
xGrad = conv2(grayed, [-1, 1]);
xGrad = xGrad((1:size(grayed, 1)), (1:size(grayed, 2)));
xGrad = xGrad.^2;
% convolve with [1; -1] for y gradient, remove extra row
yGrad = conv2(grayed, [-1; 1]);
yGrad = yGrad(1:size(grayed, 1), 1:size(grayed,2));
yGrad = yGrad.^2;
energy = abs(yGrad) + abs(xGrad);
%imshow(energy);
