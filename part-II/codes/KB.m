function kb=KB(node_ID,n);
kb_space.kB=[];
for i=1:1000;
    node_temp=node_ID;
    for ii=1:n;
        kb_temp{ii}=[];
    end

    r = randi([2 30],1);
    r1 = randi(999,1,r);   

     node_temp(i)=[];

    
     node_ID_random{i}=node_temp(1,r1);


for j=1:r;
        xr=bitxor(node_ID_random{i}(j),node_ID(i));  
        if xr==0
            node_ID_random{i}(j)
            node_ID(i)
            disp('Zero in XOR')
        end
        for p=1:n;
            
            if ( xr >= 2^(p-1) ) & ( xr <= (2^(p)-1));
                kb_temp{p}(j)=node_ID_random{i}(j);
            end

        end
end
kb_space.kB{i}= kb_temp;
end

for i=1:1000
    kb_temp=kb_space.kB{i};
    for l=1:n;
         A=find(kb_temp{l});
         S=isempty(A);
         if S==0
         kb_temp{l}=kb_temp{l}(A);
         end
    end
    kb_space.kB{i}=kb_temp;
end
kb=kb_space.kB;

%-------------setting up finished-------------------------
non_selected_IDs=[];
non_number=[];
z=1;



for i=1:1000
    par=0;
    for l=1:1000;
        a=find(node_ID_random{l}==node_ID(i));
        b=isempty(a);        
        if b==0;
            par=par+1;
        end
    end
    
    
    if par==0;
             non_selected_IDs(z)=node_ID(i);
             non_number(z)=i;
            z=z+1;
    end
end





sz3=size(non_selected_IDs);
b=isempty(non_selected_IDs); 
if b==0;
    for i=1:sz3(2);
%       node_temp=node_ID;
%       node_temp(non_number(i))=[];
xx=0;
while xx==0
      r2 = randi(1000,1);
      if r2~=non_number(i);
          xx=1;
      end
end
        kb_temp=kb{r2};
        xr=bitxor(non_selected_IDs(i),node_ID(r2));
        for p=1:n;
            
            if ( xr >= 2^(p-1) ) & ( xr <= (2^(p)-1));
                sz4=size(kb_temp{p});
                kb_temp{p}(sz4(2)+1)=non_selected_IDs(i);
            end
        end
         kb_space.kB{r2}=kb_temp;   

    end
end
kb=kb_space.kB;
return 

            