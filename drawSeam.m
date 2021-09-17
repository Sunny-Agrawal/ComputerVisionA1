function drawn = drawSeam(oImage, seam)
%draw out the seam on the original color image
%make seam pixels red
drawn = imread(oImage);
seamSize = size(seam);
numPixels = seamSize(1);
for pixel = 1:numPixels
    row = seam(pixel, 1);
    column = seam(pixel, 2);
    drawn(row, column,:) = [255, 0, 0];
end
imwrite(drawn, 'drawnSeam.jpg');
imshow('drawnSeam.jpg');