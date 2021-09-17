oImage = imread('ut.jpg');
energy = GetEnergy(oImage);
vEnergy = GetVertEnergy(energy);
hEnergy = GetHorzEnergy(energy);

subplot(3, 1, 1);
imagesc(energy);
title('Energy function');

subplot(3, 1, 2);
imagesc(vEnergy);
title('Vertical Cumulative Energy');

subplot(3, 1, 3);
imagesc(hEnergy);
title('Horizontal Cumulative Energy');