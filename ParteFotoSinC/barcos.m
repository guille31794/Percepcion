function [por,buque,submarino,lancha]=barcos(ocupadas)
    for loop=1:4
        pos(1,:)=ocupadas(1,:);
        barco(1,:)=ocupadas(1,:);
        toErase(1)=1;
        p=2;
        for i=2:length(ocupadas(:,1))
            if ocupadas(i,1)==pos(1,1) %Si fila==
                if ocupadas(i,2)==pos(1,2)+1 %Igual a columna+1
                    pos(1,:)=ocupadas(i,:);
                    barco(p,:)=ocupadas(i,:);
                    toErase(i)=i;
                    p=p+1;
                end
            end
            if ocupadas(i,2)==pos(1,2) %Si col==
                if ocupadas(i,1)==pos(1,1)+1 %Igual a fila+1
                    pos(1,:)=ocupadas(i,:); 
                    barco(p,:)=ocupadas(i,:);
                    toErase(i)=i;
                    p=p+1;
                end
            end
        end
        ocupadas([toErase],:)=[];
        long=length(barco(:,1));
        switch long
            case 1
                lancha=barco;
            case 3
                submarino=barco;
            case 4
                buque=barco;
            case 5
                por=barco;
        end
        clear toErase;
        clear pos;
        clear barco;
    end
end