function shrunkMat = removeHorizontal(oImageMat, numPixels);
shrunkMat = oImageMat;
%Outer loop for each seam to remove
for p = 1:numPixels
    %initialize matrix with same dimensions as previous image except 1
    %column less.
    prevMatSize = size(shrunkMat);
    newMat = zeros(prevMatSize(1) - 1, prevMatSize(2), 3, 'uint8');
    newMatSize = size(newMat);
    seam = GetHorzSeam(shrunkMat);
    
    %drawSeam('shrunkImage.jpg', seam);
    %seam stored as matrix of 2 columns, each row representing a pixel to
    %remove. The 1st column represents its row index, 2nd value represents
    %its column index.
    
    %inner loop for each pixel
    pixToRemove = [0, 0];
    for pixNum = 1:newMatSize(2)
        pixToRemove(1, :) = seam(pixNum, :);
        pixRow = pixToRemove(1, 1);
        pixColumn = pixToRemove(1, 2);
        %copy all values above pixel into newMat. Ignore edge case
        %(top pixel to remove)
        if pixToRemove(1, 1) ~= 1
            newMat(1: pixRow - 1, pixColumn, :) = shrunkMat(1 : pixRow - 1, pixColumn, :);
        end
        
        %DEBUGGING CODE
        %newMatTest = newMat(pixRow, 1 : pixColumn - 1, :);
        %shrunkMatTest = shrunkMat(pixRow, 1 : pixColumn - 1, :);
        %imwrite(newMat, 'newTest.jpg');
        %imwrite(shrunkMat, 'prevTest.jpg');
        %-------------
        
        %copy all values under pixel into newMat. Ignore edge case
        %(bottom pixel to remove)
        if pixToRemove(1, 1) ~= prevMatSize(1)
            newMat(pixRow : newMatSize(1), pixColumn, :) = shrunkMat(pixRow + 1 : prevMatSize(1), pixColumn, :);
        end            
    end
    shrunkMat = newMat; 
end

