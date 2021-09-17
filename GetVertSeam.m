function vertSeam = GetVertSeam(oImageMat);
%given an image's, get the energy function and a vertical seam
%seam stored as a matrix of two columns where each row represents a pixel,
%the first column stores its row index and the second column stores its column
%index
energy= GetEnergy(oImageMat);
enSize = size(energy);

cumEnergy = GetVertEnergy(energy);

%Trace the minimum values back upward and take their column index as the
%value to put in the vertical seam vector
vertSeam = zeros(enSize(1), 2);
%Get the minimum from the bottom row
[minVal, minIndex] = min(cumEnergy(enSize));
vertSeam(enSize(1), 1) = enSize(1);
vertSeam(enSize(1), 2) = minIndex;
for row = enSize(1) - 1:-1:1
    %Get the three pixels above the previous one.
    %Handle edge cases
    possiblePixels = zeros(1, 3);
    if minIndex == 1
        possiblePixels(1, 2:3) = cumEnergy(row, minIndex : minIndex + 1);
        possiblePixels(1, 1) = possiblePixels(1, 2) + 1;
    elseif minIndex == enSize(2)
        possiblePixels(1, 1:2) = cumEnergy(row, minIndex - 1 : minIndex);
        possiblePixels(1, 3) = possiblePixels(1,2) + 1;
    else
        possiblePixels = cumEnergy(row, minIndex - 1 : minIndex + 1);
    end
    %Get the minimum of the three, its index in the possiblePixels submatrix
    %will be either 1, 2, or 3
    [pixel, whichOfThree] = min(possiblePixels);
    %Get the minimum's index in the cumEnergy matrix
    minIndex = minIndex - 2 + whichOfThree;
    vertSeam(row, 2) = minIndex;
    vertSeam(row, 1) = row;
end



