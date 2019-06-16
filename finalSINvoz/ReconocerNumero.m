function number = ReconocerNumero()
    load prototipos
    ceps = ComandoVoz();
    comparations = zeros(4, 10);

    parfor j = 1:10
        for i = 1:4
            comparations(i,j) = dtw(prototipos{i,j}(:), ceps(:));
        end
    end
    a = min(comparations);
    [~, number] = min(a);
    if(number == 10)
        number = 0;
end