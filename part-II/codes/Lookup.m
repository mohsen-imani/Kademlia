
% bayad ye factore K tarif konammm ke toole har KB bashe felan hamoon n
% bashe
function [Number_of_lookups,Closet_nodes]=Lookup(kb_space, node_ID,Node_ID,Key_ID,n,k,alpha)
%------------------ seting up K-Buckets------------------
Number_of_lookups=0;
t=0;
cc=[];
sent_alpha=[];
%dd=zeros(k,k);
% kb_space.ID{z}=Node_ID;
%kb_space=KB(node_ID,n);
% we have to select a random ID for starting the look up process
%r = randi(1000,1);
%Node_ID_Start=node_ID(r);
r=find(node_ID==Node_ID);
min_dist=FNR(kb_space{r}, Key_ID, alpha,n);
sz_min_dist=size(min_dist);
sent_alpha=(bitxor(min_dist, Key_ID));
% z=z+1;
while t==0;
Number_of_lookups=Number_of_lookups+1;
for j=1:sz_min_dist(2);
%     kb_space.ID{z}=min_finder(j);
%     kb_space.kB{z}=KB(kb_space.ID{z});
    cc{j}=FNR(kb_space{find(node_ID==min_dist(j))}, Key_ID,k,n);
%    z=z+1;
end

cc=cell2mat(cc);
bb=bitxor(cc, Key_ID);
% bb=reshape(bb,1,alpha*k);
bb=sort(bb);
bb=setdiff(bb, sent_alpha);
bb_empty=isempty(bb);
if bb_empty==0
 sz_bb=size(bb);
 if sz_bb(2)>k
     min_dist=bb(1,1:k);
     sent_alpha=sort([sent_alpha, min_dist]);
     min_dist=bitxor(min_dist, Key_ID);
 else
     min_dist=bb(1,1:sz_bb(2));
     sent_alpha=sort([sent_alpha, min_dist]);
     min_dist=bitxor(min_dist, Key_ID);
 end
else
    t=1;
end
sz_min_dist=size(min_dist);
cc=[];
end

sz_sent_alpha=size(sent_alpha);
if sz_sent_alpha(2)> k
Closet_nodes=bitxor(sent_alpha(1,1:k), Key_ID);
else
Closet_nodes=bitxor(sent_alpha(1,1:sz_sent_alpha(2)), Key_ID);
end

return
