clc, clear, close all

%imagen=tablero();
imagen=imread('tablero 10x10.jpg');
imagen=rgb2gray(imagen);
[lines,E]=CalcLines(imagen);

figure,imshow(E);
for k=1:length(lines)
    xy=[lines(k).point1; lines(k).point2];
    line(xy(:,1),xy(:,2),'LineWidth',1.5,'Color','r');
end

[x,y,col,fil,xs,ys]=CalcBigLines(lines);

figure,imshow(E);
for k=1:length(lines)
   line(x(k,:),y(k,:),'LineWidth',1.5,'Color','r') 
end

[Xcol,Ycol,Xfil,Yfil]=Ord(x,y,col,fil);

figure,imshow(E);
for k=1:length(col)
   line(Xcol(k,:),Ycol(k,:),'LineWidth',1.5,'Color','r')
   pause();
end

figure,imshow(E);
for k=1:length(fil)
   line(Xfil(k,:),Yfil(k,:),'LineWidth',1.5,'Color','r')
   pause();
end

im=takeSquares(imagen,Xcol,Ycol,Xfil,Yfil);

ocupadas=search(im);

[por,buque,submarino,lancha]=barcos(ocupadas);



