%% Script for Code 2.1
im1 = double(imread('0.png'));
im2 = double(imread('1.png'));
[rows,cols]=size(im1);

[imX, imY] = imGradients(im1,1);

[u,v]=LKflow(im1, im2, imX, imY);

quiver(1:cols,1:rows,u,v,100)
imwrite(gcf,'Proj5-2-1-1.jpg','jpg');

% imwrite(uint8(u),'Proj5-2-1-1.jpg');
% imwrite(uint8(v),'Proj5-2-1-2.jpg');

im1 = double(imread('1.png'));
im2 = double(imread('2.png'));

[imX, imY] = imGradients(im1,1);

[u,v]=LKflow(im1, im2, imX, imY);

imwrite(uint8(u),'Proj5-2-1-3.jpg');
imwrite(uint8(v),'Proj5-2-1-4.jpg');
