function [matrix]=createMatrix(ocupadas)
    for i=1:10
       for j=1:10
          if length(find(ocupadas(:,1)==i & ocupadas(:,2)==j))==1
              matrix(i,j)=1;
          else
              matrix(i,j)=0;
          end
       end
    end
end