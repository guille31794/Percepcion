function sim = DTW(x1, x2)
    matrix = zeros(length(x1), length(x2));
    
    matrix(1) = abs(x1(1) - x2(1));
    
    for i = 2:length(x1)
        matrix(i,1) = matrix(i-1,1)+abs(x1(i) - x2(1));
    end
    
    for j = 2:length(x2)
        matrix(1, j) = matrix(1,j-1) + abs(x1(1) - x2(j));
        for i = 2:length(x1)
            matrix(i,j) = min([matrix(i-1,j) matrix(i, j-1) matrix(i-1,j-1)]) + abs(x1(i)-x2(j));
        end
    end
    sim = matrix(end);
end