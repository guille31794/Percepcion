function cepstrum = ComandoVoz()
    x = 0;  
    t = 3;
    Fs = 8000;
    num_bits = 16;
    Ch = 1;
    recObj = audiorecorder(Fs, num_bits, Ch);
    disp('Start speaking.')
    recordblocking(recObj, t);
    disp('End of Recording.');
    play(recObj);
    %2.
    senal =  getaudiodata(recObj);
    %Corrección del micro: no detecta nada el primer medio segundo.
    %(Deshabilitar para ordenador genérico)
    %senal = senal(Fs/2 + 1:end);
    
    %figure,plot(senal);
    a = 0.95;
    senal_filtrada = filter([1 -a], 1, senal);
    %figure; plot(senal_filtrada);

    %3.
    tam_seg = Fs*0.03;
    tam_desp = tam_seg/4;
    tam_solap = tam_seg - tam_desp;
    segmentos = buffer(senal, tam_seg, tam_solap, 'nodelay');
    ventana = hanning(tam_seg);
    ventanas = repmat(ventana, 1, size(segmentos, 2));
    segmentos_enventanados = segmentos .* ventanas;
    %4.
    %Energía localizada (por segmento):
    E = sum(segmentos.^2 .* ventanas.^2);
    %Magnitud localizada:
    M = sum(abs(segmentos).*ventanas);
    %Tasa cruces por cero:
    A = segmentos(1:end-1,:);
    B = segmentos(2:end,:);
    ventanaC = repmat(hanning(tam_seg - 1), 1, size(segmentos,2));
    tasaCruces = sum(abs(sign(A) - sign(B)).*ventanaC)/(2*size(segmentos,1));

    %5.
    M2 = sum(abs(segmentos));
    M2s = M2(1:10);
    tasaCrucesS = tasaCruces(1:10);
    mediaM = mean(M2s);
    mediaZ = mean(tasaCrucesS);
    stdM = std(M2s);
    stdZ = std(tasaCrucesS);

    UmbSupNRG = max(M2)/2;
    UmbInfNRG = mediaM + 2*stdM;
    UmbCruCero = mediaZ + 2*stdZ;

    n = 11;
    while(M2(n) < UmbSupNRG)
        n = n+1;
    end

    while(M2(n) > UmbInfNRG && n > 11)
        n = n - 1;
    end

    le = n;
    contador = 0;
    inicio = le;
    while(n > le - 25 && n > 11)
        n = n - 1;
        if(tasaCruces(n) > UmbCruCero)
            contador = contador + 1;
            if(contador >= 3)
                inicio = n;
            end
        else
            contador = 0;
        end   
    end

    %Calcular fin de palabra
    M2s = M2(end-10:end);
    tasaCrucesS = tasaCruces(end-10:end);mediaM = mean(M2s);
    mediaZ = mean(tasaCrucesS);
    stdM = std(M2s);
    stdZ = std(tasaCrucesS);
    UmbInfNRG = mediaM + 2*stdM;
    UmbCruCero = mediaZ + 2*stdZ;

    n = length(M2)-10;
    while(M2(n) < UmbSupNRG)
        n = n-1;
    end

    while(M2(n) > UmbInfNRG && n < length(M2)-10)
        n = n + 1;
    end

    le = n;
    contador = 0;
    fin = le;
    while(n < le + 25 && n < length(M2)-10)
        n = n + 1;
        if(tasaCruces(n) > UmbCruCero)
            contador = contador + 1;
            if(contador >= 3)
                fin = n;
            end
        else
            contador = 0;
        end   
    end



    %6
%     senal_original = 0;
%     for i = inicio:fin
%         b = segmentos(1:end-tam_solap,i);
%         senal_original = [senal_original;b];
%     end
%     figure;
    %plot(senal_original);
% 
%     obj_senal = audioplayer(senal_original, Fs);
%     play(obj_senal);

    senal_sonora = senal(tam_seg + inicio*tam_desp:tam_seg+fin*tam_desp);

    %filas a coge de cepstrum
    nfilas = 15;
    %cantidad de p a utilizar
    pvalues = 5;

    cepstrum = real(ifft(log(abs(fft(segmentos_enventanados(:, inicio:fin))))));
    cepstrum = cepstrum(2:nfilas+1,:);

    %añadir a cepstrum p columnas de ceros a ambos lados
    cepstrumaux = [zeros(nfilas,pvalues) cepstrum zeros(nfilas,pvalues)];

    %crear matriz desde -p a p, con nfilas filas
    p = -pvalues:pvalues;
    pmat = repmat(p,nfilas,1);

    filaSegs = [zeros(1,pvalues) ones(1, size(cepstrum,2)), zeros(1,pvalues)];

    cepstrum = [cepstrum; zeros(size(cepstrum))]; %reserva memoria para cepstrum delta

    %bucle, calcula los deltas columna a columna.
    for i = 1:size(cepstrumaux, 2)-pvalues*2
        a = cepstrumaux(:, i:i+pvalues*2).*pmat;

        denom = sum((p .* filaSegs(i:i+pvalues*2)).^2);

        cepstrum(nfilas+1:end,i) = sum(a,2)/denom;
    end

    %3.
    means = mean(cepstrum);
    stds = std(cepstrum);
    means = repmat(means, size(cepstrum, 1), 1);
    stds = repmat(stds, size(cepstrum, 1), 1);

    %Normalización.
    cepstrum = cepstrum-means./stds;
    
end
