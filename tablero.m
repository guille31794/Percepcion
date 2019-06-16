function tab=tablero()
    cam=webcam;
    preview(cam);
    pause(5);
    tab=snapshot(cam);
    imshow(tab);
end