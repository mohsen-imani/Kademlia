function fnr=FNR(kb, Key_ID,n);
% fnd=[];
% b=strcut([]);
c=zeros(1,n);
cmp=struct([]);
for ii=1:50;
    cmp{ii}=bitxor(kb{ii},Key_ID);
end
 cell_cmp=cell2mat(cmp);
 sort_cell_cmp=sort(cell_cmp);
 min_finder=sort_cell_cmp(1,1:n);
 for i=1:n
     for j=1:50;
         sz=size(cmp{j});
         a=cmp{j};
         for k=1:sz(2);
             if a(1,k)==min_finder(i);
%                  b{i}=[j k];
                 c(i)=a(k);
             end
         end
     end
 end
    fnr=bitxor(c,Key_ID);  
   
     
 
         
    
return 
    