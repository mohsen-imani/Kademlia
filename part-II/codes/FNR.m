function fnr=FNR(kb, Key_ID,alpha,n);
% fnd=[];
% b=strcut([]);
% % c=zeros(1,n);
% % cmp=struct([]);
for ii=1:n;
    cmp{ii}=bitxor(kb{ii},Key_ID);
end
 cell_cmp=cell2mat(cmp);
 sort_cell_cmp=sort(cell_cmp);
 sz=size(sort_cell_cmp);
 if sz(2)> alpha;
 min_finder=sort_cell_cmp(1,1:alpha);
 else 
  min_finder=sort_cell_cmp(1,1:sz(2));   
 end
%  for i=1:n
%      for j=1:50;
%          sz=size(cmp{j});
%          a=cmp{j};
%          for k=1:sz(2);
%              if a(1,k)==min_finder(i);
% %                  b{i}=[j k];
%                  c(i)=a(k);
%              end
%          end
%      end
%  end
    fnr=bitxor(min_finder,Key_ID);  
  return 
    