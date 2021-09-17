utImgMat = imread('ut.jpg');
vSeam = GetVertSeam(utImgMat);
hSeam = GetHorzSeam(utImgMat);
drawSeam('ut.jpg', vSeam);
drawSeam('drawnSeam.jpg', hSeam);
copyfile drawnSeam.jpg utSeams.jpg;