clear, close, clc

imagen=tablero();
imagen=rgb2gray(imagen);
%Aplico enfasis de alta frecuencia (mayor luminosidad).
%h=ones(3,3)*(-1);
%el valor multiplicado por el 9 es la ganancia, a cambiar en caso de
%necesidad.
%h(2,2)=9*3-1; 
%h=1/9*h;
%imagen=imfilter(imagen,h);

%Aplico realzado de bordes.
h=ones(3,3)*(-1);
h(2,2)=9;
h=1/9*h;
imagen=imfilter(imagen,h);
figure,imshow(imagen);
max_dist=sqrt(size(imagen,1)^2+size(imagen,2)^2);
validation=0;
i=0;
while i<250 && validation~=22
    i=i+10;
    imagen2=imagen>i;
    E=edge(imagen2,'canny');

    [H, theta, rho]=hough(E);

    peaks=houghpeaks(H,22);
    validation=length(peaks);
    lines=houghlines(E, theta, rho, peaks, 'FillGap', max_dist);
end
figure,imshow(E);
for k=1:length(lines)
    xy=[lines(k).point1; lines(k).point2];
    line(xy(:,1),xy(:,2),'LineWidth',1.5,'Color','r');
end