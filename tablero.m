function tab=tablero()
    cam=webcam;
    preview(cam);
    %hold on;
    %x=linspace(160, 560);
    %y=linspace(200, 1080);
    %line(x, y, 'g');

    pause(8);
    tab=snapshot(cam);
    imshow(tab);
end