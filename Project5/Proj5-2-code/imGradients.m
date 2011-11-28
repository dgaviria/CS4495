function [imX, imY] = imGradients(image, ratio)

h = fspecial('gaussian', 3*ratio, .5*ratio);
im = imfilter(image, h);
[imX, imY] = gradient(im);

end