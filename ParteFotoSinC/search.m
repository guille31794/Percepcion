function ocupadas=search(im)
    ok=1;
    for i=1:10
       for j=1:10
          c1=im{i,j}>10;
          c2=im{i,j}<=125;
          oscuros=length(im{i,j}(c1&c2));
          c1=im{i,j}>130;
          c2=im{i,j}<=255;
          claros=length(im{i,j}(c1&c2));
          if oscuros>claros
              ocupadas(ok,:)=[i,j];
              ok=ok+1;
       end
    end
end