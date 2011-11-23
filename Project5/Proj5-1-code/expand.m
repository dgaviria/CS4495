function newIm = expand(im)

[rows,cols] = size(im);
% newRows = (rows-1)*2+1; newCols=(cols-1)*2+1;
newRows = rows*2; newCols = cols*2;
newIm = zeros(newRows, newCols);
w = fspecial('gaussian',5,1);

for r = 4:newRows-2
    for c = 4:newCols-2
        for m= -2:2
            for n= -2:2
                if (mod(r-m, 2)==0) && (mod(c-n, 2)==0)
                    newIm(r,c) = newIm(r,c) + (w(m+3,n+3) * im((r-m)/2, (c-n)/2));
                end
%                 newIm(r,c) = newIm(r,c) + (w(m+3,n+3) * im(floor((r-m)/2), floor((c-n)/2)));
            end
        end
        newIm(r,c) = 4*newIm(r,c);
    end
end

end
