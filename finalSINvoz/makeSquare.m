function [xC,yC,xLine,yLine]=makeSquare(Xcol,Ycol,Xfil,Yfil)
    %Crea el vector [a,b,c,d] necesatio para la funcion square.
    
    %x interseccion.
    xC=mean(Xcol(1,1),Xcol(1,2));
    %y interseccion.
    yC=mean(Yfil(1,1),Yfil(1,2));
    %yLine.
    xLine=Xcol(2,1)-Xcol(1,1);
    %xLine.
    yLine=(abs(Yfil(1,1)-Yfil(2,1))+abs(Yfil(2,1)-Yfil(1,1)))/2;
end