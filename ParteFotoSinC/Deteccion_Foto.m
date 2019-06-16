clc, clear, close all

%imagen=tablero();
imagen=imread('tablero 10x10.jpg');
imagen=rgb2gray(imagen);
[lines,E]=CalcLines(imagen);

[x,y,col,fil,xs,ys]=CalcBigLines(lines);

[Xcol,Ycol,Xfil,Yfil]=Ord(x,y,col,fil);


im=takeSquares(imagen,Xcol,Ycol,Xfil,Yfil);

ocupadas=search(im);

[por,buque,submarino,lancha]=barcos(ocupadas);



