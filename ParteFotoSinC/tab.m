 n = 10;
 tabla = cell(n+1,n+1);
 % initialize the board
 for u=1:n+1
     for v=1:n+1
         if u==1
             if v<=n
                 tabla{u,v+1} = int2str(v);
                 tabla{v+1,u} = int2str(v);
             end
         elseif v==1
             % do nothing
         else
             tabla{u,v} = ' ';
         end
     end
 end
 
 for i = 2:n+1
     for j = 2:n+1
         if matrix(i-1,j-1) == 2
             tabla{i,j} = 'X';
         else
             if matrix(i-1, j-1) == 3
                 tabla{i,j} = 'O';
             end
         end
     end
 end
 
 %line(10) = [];
 linea = [];
 for i = 1:n+1
     line = [];
     for j = 1:n+1
        line = [line ' ' tabla{i,j}];
     end
     if i == 11
        linea = [linea;line(2:end) '\n'];
     else
         linea = [linea;line '\n'];
     end
 end
 
 