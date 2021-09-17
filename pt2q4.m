oImage = imread('ut.jpg');
energy = modifiedEnergy(oImage);
vEnergy = GetVertEnergy(energy);
hEnergy = GetHorzEnergy(energy);

subplot(3, 1, 1);
imagesc(energy);
title('Energy function calculated with sum of squares of horizontal and vertical derivatives.');

subplot(3, 1, 2);
imagesc(vEnergy);
title('Vertical Cumulative Energy');

subplot(3, 1, 3);
imagesc(hEnergy);
title('Horizontal Cumulative Energy');