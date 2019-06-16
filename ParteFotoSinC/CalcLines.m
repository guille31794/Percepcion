function [lines,E]=CalcLines(imagen)
    %Calcula las lineas de la imagen introducida.
    %En nuestro caso realiza trans. binarias hasta encontrar las 22 lineas 
    %que sabemos que tiene.
    %·Salida: lines-> struct lines.
    %         E-> Imagen sobre la que esas lineas fueron calculadas.
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
end