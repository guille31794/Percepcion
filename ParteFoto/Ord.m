function [Xcol,Ycol,Xfil,Yfil]=Ord(x,y,col,fil)
    %Devuelve columnas y filas separadas.
    %Las ordena dependiendo de si son filas o columnas.
    %·Salida: columnas-> x y de las columnas.
    %         fila-> x y de las filas.
    columnas=[x(col,1),x(col,2),y(col,1),y(col,2)];
    filas=[x(fil,1),x(fil,2),y(fil,1),y(fil,2)];
    [~,idx]=sort(columnas(:,1));      %Ordenamos en funcion de las x.
    columnas=columnas(idx,:);
    [~,idy]=sort(filas(:,3));         %Ordenamos en funcion de las y.
    filas=filas(idy,:);
    Xcol=[columnas(:,1),columnas(:,2)];
    Xfil=[columnas(:,3),columnas(:,4)];
    Ycol=[filas(:,1),filas(:,2)];
    Yfil=[filas(:,3),filas(:,4)];
end