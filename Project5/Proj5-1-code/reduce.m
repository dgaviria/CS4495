function newIm = reduce(im)

[rows,cols] = size(im);
newRows = rows/2; newCols=cols/2;
newIm = zeros(rows/2, newCols);

w = fspecial('gaussian',5,1);

for r = 3:newRows-2
    for c = 3:newCols-2
        for m= -2:2
            for n= -2:2
                newIm(r,c) = newIm(r,c) + (w(m+3,n+3) * im(2*r+m, 2*c+n));
            end
        end
    end
end

end
