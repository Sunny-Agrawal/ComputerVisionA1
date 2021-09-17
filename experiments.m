% %Running some experiments on seam removals.
% 
% %Let's push the removals to its limits, what happens when we remove a
% %disproportionately large amount of seams? Does the focus of the image get
% %cut out?
utMat = imread('ut.jpg');
% utSuperSqueeze = removeVertical(utMat, 400);
% imwrite(utSuperSqueeze, 'utSuperSqueeze.jpg');
utSuperSqueezeO = imresize(utMat, [470, 291]);
imwrite(utSuperSqueezeO, 'utSuperSqueezeO.jpg');
% utSuperShrunk = removeHorizontal(utMat, 250);
% imwrite(utSuperShrunk, 'utSuperShrunk.jpg');
utSuperShrunkO = imresize(utMat, [220, 691]);
imwrite(utSuperShrunkO, 'utSuperShrunkO.jpg');
% utSuperResized = removeHorizontal(utSuperSqueeze, 250);
% imwrite(utSuperResized, 'utSuperResized.jpg');
utSuperResizedO = imresize(utMat, [220, 291]);
imwrite(utSuperResizedO, 'utSuperResizedO.jpg');


% %What happens when there is text in the image?
greatSuccessMat = imread('great_success.png');
% squeezedSuccessMat = removeVertical(greatSuccessMat, 200);
% shrunkSuccessMat = removeHorizontal(greatSuccessMat, 257);
% resizedSuccessMat = removeHorizontal(squeezedSuccessMat, 257);
squeezedSuccessMatO = imresize(greatSuccessMat,[515, 200]);
shrunkSuccessMatO = imresize(greatSuccessMat,[258, 400]);
resizedSuccessMatO = imresize(greatSuccessMat,[258, 200]);
% imwrite(squeezedSuccessMat, 'squeezedSuccess.jpg');
% imwrite(shrunkSuccessMat, 'shrunkSuccess.jpg');
% imwrite(resizedSuccessMat, 'resizedSuccess.jpg');
imwrite(squeezedSuccessMatO, 'squeezedSuccessO.jpg');
imwrite(shrunkSuccessMatO, 'shrunkSuccessO.jpg');
imwrite(resizedSuccessMatO, 'resizedSuccessO.jpg');

figure(1);
subplot(4, 2, [1, 2]);
imshow('ut.jpg');
title('original image, 470x691');

subplot(4, 2, 3);
imshow('utSuperSqueeze.jpg');
title('470x291 using my removeVertical(400)');

subplot(4, 2, 4);
imshow('utSuperSqueezeO.jpg');
title('470x291 using imresize');

subplot(4, 2, 5);
imshow('utSuperShrunk.jpg');
title('220x691 using removeHorizontal(250)');

subplot(4, 2, 6);
imshow('utSuperShrunkO.jpg');
title('220x691 using imresize');

subplot(4, 2, 7);
imshow('utSuperResized.jpg');
title('291x220 using removeVertical(400) and removeHorizontal(250)');

subplot(4, 2, 8);
imshow('utSuperResizedO.jpg');
title('291x220 using imresize');

figure(2);

subplot(4, 2, [1, 2]);
imshow('great_success.png');
title('original image, 515x400');

subplot(4, 2, 3);
imshow('squeezedSuccess.jpg');
title('515x200 using removeVertical(200)');

subplot(4, 2, 4);
imshow('squeezedSuccessO.jpg');
title('515x200 using imresize');

subplot(4, 2, 5);
imshow('shrunkSuccess.jpg');
title('258x400 using removeHorizontal(257)');

subplot(4, 2, 6);
imshow('shrunkSuccessO.jpg');
title('258x400 using imresize');

subplot(4, 2, 7);
imshow('resizedSuccess.jpg');
title('258x200 using removeVertical(200) and removeHorizontal(257)');

subplot(4, 2, 8);
imshow('resizedSuccessO.jpg');
title('258x200 using imresize');
