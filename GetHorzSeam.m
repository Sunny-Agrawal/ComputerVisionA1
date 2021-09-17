function horzSeam = GetHorzSeam(oImageMat);
%given an image's, get the energy function and a vertical seam
%seam stored as a matrix of two columns where each row represents a pixel,
%the first column stores its row index and the second column stores its column
%index
energy= GetEnergy(oImageMat);
enSize = size(energy);

cumEnergy = GetHorzEnergy(energy);

%Trace the minimum values back (leftward) and take their locations as the
%values to put in the horizontal seam matrix. Column 1 stores rows, column
%2 stores columns, each row represents 1 pixel.
horzSeam = zeros(enSize(2), 2);
%Get the minimum from the rightmost column
[minVal, minIndex] = min(cumEnergy(enSize(2)));
horzSeam(enSize(2), 1) = enSize(1);
horzSeam(enSize(2), 2) = minIndex;
for column = enSize(2) - 1:-1:1
    %Get the three pixels left of the previous one.
    %Handle edge cases
    possiblePixels = zeros(3, 1);
    if minIndex == 1
        possiblePixels(2:3, 1) = cumEnergy(minIndex : minIndex + 1, column);
        possiblePixels(1, 1) = possiblePixels(2, 1) + 1;
    elseif minIndex == enSize(1)
        possiblePixels(1:2, 1) = cumEnergy(minIndex - 1 : minIndex, column );
        possiblePixels(3, 1) = possiblePixels(2,1) + 1;
    else
        possiblePixels = cumEnergy(minIndex - 1 : minIndex + 1, column);
    end
    %Get the minimum of the three, its index in the possiblePixels submatrix
    %will be either 1, 2, or 3
    [pixel, whichOfThree] = min(possiblePixels);
    %Get the minimum's index in the cumEnergy matrix
    minIndex = minIndex - 2 + whichOfThree;
    horzSeam(column, 1) = minIndex;
    horzSeam(column, 2) = column;
end



