function cumEnergy = GetHorzEnergy(energy);
enSize = size(energy);
cumEnergy = zeros(enSize(1), enSize(2));
%copy first column from energy function
cumEnergy(:, 1) = energy(:, 1);
%start by getting the cumulative energy going towards the right.
%create a matrix to store the cumulative energy of potential paths going
%right. First column will match original energy matrix's first row. For all
%subsequent columns, each pixel will be the original energy value at that
%pixel plus the least of the three energies to its left (the pixel left of it
%and the pixels to the pixels above and below that pixel)
for column = 2:enSize(2);
    for row = 1:enSize(1);
        possibleEnergies = zeros(3, 1);
        %handle edge cases (first and last row)
        if row == 1
            possibleEnergies(2:3, 1) = cumEnergy(row : row + 1, column - 1);
            possibleEnergies(1, 1) = possibleEnergies(2, 1);
        elseif row == enSize(1)
            possibleEnergies(1 : 2, 1) = cumEnergy(row - 1 : row, column - 1);
            possibleEnergies(3, 1) = possibleEnergies(2,1);
        else
            possibleEnergies = cumEnergy(row - 1 : row + 1, column - 1);
        end
        enToAdd = min(possibleEnergies);
        cumEnergy(row, column) = enToAdd + energy(row, column);
    end
end
