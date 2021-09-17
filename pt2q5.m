%My intent is to test how order of seam removals effects the final result.
%I will be removing 100 vertical seams and 100 horizontal seams in each
%case. For the first image, I will remove the vertical ones first, for the
%second one, I will remove the horizontal ones first, and for the final one
%I will alternate every 20 seam removals.

utMat = imread('ut.jpg');

vertFirst = removeVertical(utMat, 100);
vertFirst = removeHorizontal(vertFirst, 100);

horzFirst = removeHorizontal(utMat, 100);
horzFirst = removeVertical(horzFirst, 100);

alternating = utMat;
for removal = 1 : 5
    alternating = removeVertical(alternating, 20);
    alternating = removeHorizontal(alternating, 20);
end

imwrite(vertFirst, 'vertFirstUt.jpg');
imwrite(horzFirst, 'horzFirstUt.jpg');
imwrite(alternating, 'alternatingUt.jpg');

subplot(3, 1, 1);
imshow('vertFirstUt.jpg');
title('Vertical Removed First');

subplot(3, 1, 2);
imshow('horzFirstUt.jpg');
title('Horizontal Removed First');

subplot(3, 1, 3);
imshow('alternatingUt.jpg');
title('Alternating Removals');