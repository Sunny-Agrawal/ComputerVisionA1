%hSeam = GetHorzSeam('river.jpg');
%drawSeam('river.jpg', hSeam);

utMat = imread('ut.jpg');
horzUtMat = removeVertical(utMat, 100);
imwrite(horzUtMat, 'horzUt.jpg');


vertUtMat = removeHorizontal(utMat, 100);
imwrite(vertUtMat, 'vertUt.jpg');


subplot(3, 1, 1);
imshow('ut.jpg');
title('original');

subplot(3, 1, 2);
imshow('horzUt.jpg');
title('Shrunk Horizontally 100 Columns');

subplot(3, 1, 3);
imshow('vertUt.jpg');
title('Shrunk Vertically 100 Rows');