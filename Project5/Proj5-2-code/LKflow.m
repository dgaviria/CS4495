function [u,v]=LKflow(im1, im2, imX, imY)

[rows, cols] = size(im1);
windowSize=5;
u=zeros(rows,cols);
v=zeros(rows,cols);

w = fspecial('gaussian', windowSize, .5*windowSize/3);
stopAt = floor(windowSize/2);

M_temp = zeros(2,2);
T_temp = zeros(2,1);

for row= stopAt+1:rows-stopAt-1
    for col= stopAt+1:cols-stopAt-1
        M=zeros(2,2);
        T=zeros(2,1);
        for x= -stopAt:stopAt
            for y= -stopAt:stopAt
                It = im2(row+x,col+y)-im1(row+x,col+y);
                
                M_temp(1,1) = imX(row+x,col+y).^2;
                M_temp(1,2) = imX(row+x,col+y) .* imY(row+x,col+y);
                M_temp(2,2) = imY(row+x,col+y).^2;
                T_temp(1,1) = imX(row+x,col+y) .* It;
                T_temp(2,1) = imY(row+x,col+y) .* It;
                
                M_temp = M_temp * w(x+stopAt+1,y+stopAt+1);
                T_temp = T_temp * w(x+stopAt+1,y+stopAt+1);
                
                M = M + M_temp;
                T = T + T_temp;
            end
        end
        
        M(2,1)=M(1,2);
        T = -T;
        
%         make two new images U and V that are the x and y displacements
%         [u(x, y) and v(x, y)]
        warning off MATLAB:singularMatrix
        uv = M\T;
        if (isnan(uv(1,1)) || (abs(uv(1,1))<.01))
            u(row,col) = 0;
        else
            u(row,col) = uv(1,1);
        end
        if (isnan(uv(2,1)) || (abs(uv(2,1))<.01))
            v(row,col) = 0;
        else
            v(row,col) = uv(2,1);
        end
    end
end

end