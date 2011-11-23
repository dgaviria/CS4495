%% Script for Code 1.1
g0 = double(rgb2gray(imread('0.png')));
levels = 4;


g1 = reduce(g0);
imwrite(uint8(g1),'Proj5-1-1-1.jpg');

g2 = reduce(g1);
imwrite(uint8(g2),'Proj5-1-1-2.jpg');

g3 = reduce(g2);
imwrite(uint8(g3),'Proj5-1-1-3.jpg');

g4 = reduce(g3);
imwrite(uint8(g4),'Proj5-1-1-4.jpg');

%% Script for Code 2.2
L4 = g4;
imwrite(uint8(L4),'Proj5-1-2-1.jpg');

L3 = g3 - expand(g4);
imwrite(uint8(L3),'Proj5-1-2-2.jpg');

L2 = g2 - expand(g3);
imwrite(uint8(L2),'Proj5-1-2-3.jpg');

L1 = g1 - expand(g2);
imwrite(uint8(L1),'Proj5-1-2-4.jpg');

L0 = g0 - expand(g1);
imwrite(uint8(L0),'Proj5-1-2-5.jpg');
