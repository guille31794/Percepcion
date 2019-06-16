function [imagen,matrix]=makeCircles(imagen,Xcol,Ycol,Xfil,Yfil,matrix,Xpos,Ypos)    
    for i=1:10
        for j=1:10
            if  Xpos==i & Ypos==j
                if matrix(i,j)==0 | matrix(i,j)==1
                    [xC,yC,xLine,yLine]=makeSquare(Xcol(j:j+1,:),Ycol(j:j+1,:),Xfil(i:i+1,:),Yfil(i:i+1,:));
                    rectangle('Position',[xC,yC,xLine,yLine],'Curvature',[1,1],'FaceColor',[1,0,0],'EdgeColor','r');
                    matrix(i,j)=2;
                else
                    disp('Posicion ya bombardeada');
                end
            end
        end
    end
end