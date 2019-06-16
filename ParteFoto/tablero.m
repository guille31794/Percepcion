function tab=tablero()
    %La salida es el tablero de juego de la practica.
    cam=webcam;
    preview(cam);

    pause(8);
    tab=snapshot(cam);
    tab=rgb2gray(tab);
    imshow(tab);
end