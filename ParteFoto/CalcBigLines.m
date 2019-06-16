function [x,y,columna,fila,xs,ys]=CalcBigLines(lines)
    %Averigua si las lineas perteneces a columnas o filas, luego alarga las
    %lineas para obtener un mejor resultado.
    %·Entrada: lines-> struct lines empleada.
    %·Salida:  x-> Nuevos valores de la x.
    %          y-> Nuevos valores de la y.
    %          columna-> Indica que lineas son columnas.
    %          linea-> Indica que lineas son filas.
    %          xs-> Viejos valores de la x.
    %          ys-> Viejos valores de la y.
    x=[lines(1).point1(1),lines(1).point2(1)];
    xs=[lines(1).point1(1),lines(1).point2(1)];
    y=[lines(1).point1(2),lines(1).point2(2)];
    ys=[lines(1).point1(2),lines(1).point2(2)];
    for k=2:length(lines)
        x=[x;lines(k).point1(1),lines(k).point2(1)];
        xs=[xs;lines(1).point1(1),lines(1).point2(1)];
        y=[y;lines(k).point1(2),lines(k).point2(2)];
        ys=[ys;lines(1).point1(2),lines(1).point2(2)];
    end

    i=0;
    j=0;
    for k=1:length(lines)
        l=abs(x(k,1)-x(k,2));
        c=abs(y(k,1)-y(k,2));
        if l>c
            i=i+1;
            fila(i)=k;
        end
        if c>l
            j=j+1;
            columna(j)=k;
        end
    end

    x(fila,1)=x(fila,1)-200;
    x(fila,2)=x(fila,2)+200;

    y(columna,1)=y(columna,1)-200;
    y(columna,2)=y(columna,2)+200;
end