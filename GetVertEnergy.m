function cumEnergy = GetVertEnergy(energy);
enSize = size(energy);
cumEnergy = zeros(enSize(1), enSize(2));
%copy first row from energy function
cumEnergy(1, :) = energy(1, :);
%start by getting the cumulative energy going downward.
%create a matrix to store the cumulative energy of potential paths going
%downward. First row will match original energy matrix's first row. For all
%subsequent rows, each pixel will be the original energy value at that
%pixel plus the least of the three energies above it (the pixel above it
%and the pixels to the left and right of that pixel)
for row = 2:enSize(1);
    for column = 1:enSize(2);
        possibleEnergies = zeros(1, 3);
        %handle edge cases (first and last column)
        if column == 1
            possibleEnergies(1, 2 : 3) = cumEnergy(row - 1, column: column + 1);
            possibleEnergies(1, 1) = possibleEnergies(1, 2);
        elseif column == enSize(2)
            possibleEnergies(1, 1 : 2) = cumEnergy(row - 1, column - 1: column);
            possibleEnergies(1, 3) = possibleEnergies(1,2);
        else
            possibleEnergies = cumEnergy(row - 1, column - 1 : column + 1);
        end
        enToAdd = min(possibleEnergies);
        cumEnergy(row, column) = enToAdd + energy(row, column);
    end
end