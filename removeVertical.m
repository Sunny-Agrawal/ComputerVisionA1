function shrunkMat = removeVertical(oImageMat, numPixels);
shrunkMat = oImageMat;
%Outer loop for each seam to remove
for p = 1:numPixels
    %initialize matrix with same dimensions as previous image except 1
    %column less.
    prevMatSize = size(shrunkMat);
    newMat = zeros(prevMatSize(1), prevMatSize(2) - 1, 3, 'uint8');
    newMatSize = size(newMat);
    seam = GetVertSeam(shrunkMat);
    
    %drawSeam('shrunkImage.jpg', seam);
    %seam stored as matrix of 2 columns, each row representing a pixel to
    %remove. The 1st column represents its row index, 2nd value represents
    %its column index.
    
    %inner loop for each pixel
    pixToRemove = [0, 0];
    for pixNum = 1:newMatSize(1)
        pixToRemove(1, :) = seam(pixNum, :);
        pixRow = pixToRemove(1, 1);
        pixColumn = pixToRemove(1, 2);
        %copy all values left of pixel into newMat. Ignore edge case
        %(leftmost pixel to remove)
        if pixToRemove(1, 2) ~= 1
            newMat(pixRow, 1 : pixColumn - 1, :) = shrunkMat(pixRow, 1: pixColumn - 1, :);
        end
        
        %DEBUGGING CODE
        %newMatTest = newMat(pixRow, 1 : pixColumn - 1, :);
        %shrunkMatTest = shrunkMat(pixRow, 1 : pixColumn - 1, :);
        %imwrite(newMat, 'newTest.jpg');
        %imwrite(shrunkMat, 'prevTest.jpg');
        %-------------
        
        %copy all values right of pixel into newMat. Ignore edge case
        %(rightmost pixel to remove)
        if pixToRemove(1, 2) ~= prevMatSize(2)
            newMat(pixRow, pixColumn : newMatSize(2), :) = shrunkMat(pixRow, pixColumn + 1 : prevMatSize(2), :);
        end            
    end
    shrunkMat = newMat; 
end
