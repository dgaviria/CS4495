%% Script for Code 1.1
g0 = double(rgb2gray(imread('0.png')));
levels = 4;


g1 = reduce(g0);
imwrite(uint8(newIm1),'Proj5-1-1-1.jpg');

g2 = reduce(g1);
imwrite(uint8(newIm2),'Proj5-1-1-2.jpg');

g3 = reduce(g2);
imwrite(uint8(newIm3),'Proj5-1-1-3.jpg');

g4 = reduce(g3);
imwrite(uint8(newIm4),'Proj5-1-1-4.jpg');

%% Script for Code 2.2
L4 = g4;

L3 = g3 - expand(g4);

L2 = g2 - expand(g3);

imwrite(uint8(im3lap),'Proj5-1-2-1.jpg');

newIm2ex = expand(newIm3);
im2lap = newIm2ex - newIm2;
imwrite(uint8(im2lap),'Proj5-1-2-2.jpg');

newIm1ex = expand(newIm2);
im1lap = newIm1ex - newIm1;
imwrite(uint8(im1lap),'Proj5-1-2-3.jpg');
