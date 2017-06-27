function kb=KB(Node_ID);
kb=struct([]);
for ii=1:50;
      if [(2^(ii)-1)-2^(ii-1)]>20
          r = randi(20,1,1);
          a=randi([2^(ii-1) (2^(ii)-1)], 1, r);
%           d=randperm(((2^(ii)-1)-2^(ii-1)),r);
%           a=d+2^(ii-1);
          kb{ii}=bitxor(a, Node_ID);
      else 
          r = randi(2^(ii-1),1,1);
          a=randi([2^(ii-1) (2^(ii)-1)], 1, r);
          kb{ii}=bitxor(a, Node_ID);
      end
      
end
return 
    

