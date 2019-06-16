function jugar(imagen,matrix,Xcol,Ycol,Xfil,Yfil,por,buque,submarino,lancha)
    figure,imshow(imagen);
    final=false;
    i=1;
    tocado=false;
    while i<=23 & final==false
        Ipos=[1,2,3,4,4,4,4,4,7,7,7,8,9,7];
        Jpos=[1,1,1,4,5,6,7,8,3,4,5,8,9,6];
        [imagen,matrix]=makeCircles(imagen,Xcol,Ycol,Xfil,Yfil,matrix,Ipos(i),Jpos(i));
        if length(find(por(:,1)==Ipos(i) & por(:,2)==Jpos(i)))
            [~,ind]=find(por(:,1)==Ipos(i) & por(:,2)==Jpos(i));
            por(ind,:)=[];
            tocado=true;
            if length(por(:,1)>0)
                disp('Tocado portaaviones.')
            else
                disp('Hundido portaaviones.');
            end
        end
        if length(find(buque(:,1)==Ipos(i) & buque(:,2)==Jpos(i)))
            [~,ind]=find(buque(:,1)==Ipos(i) & buque(:,2)==Jpos(i));
            buque(ind,:)=[];
            tocado=true;
            if length(buque(:,1))>0
                disp('Tocado buque.')
            else
                disp('Hundido buque.');
            end
        end
        if length(find(submarino(:,1)==Ipos(i) & submarino(:,2)==Jpos(i)))
            [~,ind]=find(submarino(:,1)==Ipos(i) & submarino(:,2)==Jpos(i));
            submarino(ind,:)=[];
            tocado=true;
            if length(submarino(:,1))>0
                disp('Tocado submarino.')
            else
                disp('Hundido submarino.');
            end
        end
        if length(find(lancha(1,1)==Ipos(i) & lancha(1,2)==Jpos(i)))
            lancha=[0,0];
            tocado=true;
            disp('Hundido lancha.');
        end
        if tocado==false
           disp('Agua.'); 
        end
        i=i+1;
        tocado=false;
        if length(por(:,1))==0 & length(submarino(:,1))==0 & length(buque(:,1))==0 & length(por(:,1))==0
            disp('Juego acabado, todos los barcos hundidos.'); 
            final=true;
        end
        pause();
    end
end