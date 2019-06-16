function [im]=takeSquares(imagen,Xcol,Ycol,Xfil,Yfil)
    figure,imshow(imagen);
    for i=1:10
        for j=1:10
            [xC,yC,xLine,yLine]=makeSquare(Xcol(j:j+1,:),Ycol(j:j+1,:),Xfil(i:i+1,:),Yfil(i:i+1,:));
            im{i,j}=imcrop(imagen,[xC,yC,xLine,yLine]);
        end
    end
end