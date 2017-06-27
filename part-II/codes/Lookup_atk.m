
% bayad ye factore K tarif konammm ke toole har KB bashe felan hamoon n
% bashe
function [Number_of_lookups_after_attack,Closet_nodes_after_attack]=Lookup_atk(kb_space, attackers_ID,node_ID,Node_ID,Key_ID,n,k,alpha)
%------------------ seting up K-Buckets------------------
Number_of_lookups_after_attack=0;
t=0;
cc=[];
sent_alpha=[];
%---------------------attackers should be added----------
%dd=zeros(k,k);
% kb_space.ID{z}=Node_ID;
%kb_space=KB(node_ID,n);
% we have to select a random ID for starting the look up process
%r = randi(1000,1);
%Node_ID_Start=node_ID(r);



r=find(node_ID==Node_ID);
min_dist=FNR(kb_space{r}, Key_ID, alpha,n);

%------------------------------------------------------
attackers_ID=bitxor(sort(bitxor(attackers_ID, Key_ID)),Key_ID);
atk=attackers_ID;    
atk_list=[];
    
%------------------------------------------------------    
sz_min_dist=size(min_dist);
sent_alpha=(bitxor(min_dist, Key_ID));
% z=z+1;
       intersect_atk=intersect(min_dist,atk);
sz_intersect=size(intersect_atk);
while t==0;
Number_of_lookups_after_attack=Number_of_lookups_after_attack+1;
for j=1:sz_min_dist(2);
    
       empty=isempty(intersect_atk);
       if empty==0
           if j<=sz_intersect(2);
%                disp('hey I AM an attacker');
         atk(find(atk==intersect_atk(j)))=[];
         atk=setdiff(atk,atk_list);
         sz_atk=size(atk);
         if sz_atk(2)>k         
         cc{j}=atk(1,1:k);
         atk_list=[atk_list, cc{j},intersect_atk(j)];
         else 
             empty_atk=isempty(atk);
             if empty_atk==0
                cc{j}=atk(1,1:sz_atk(2));
                atk_list=[atk_list, cc{j},intersect_atk(j)]; 
             else 
                 cc{j}=[];
                 atk_list=[atk_list, cc{j},intersect_atk(j)];
             end
         end
           else
           cc{j}=FNR(kb_space{find(node_ID==min_dist(j))}, Key_ID,k,n);
%            disp('hey I am not an attacker');
           end
       else 
           cc{j}=FNR(kb_space{find(node_ID==min_dist(j))}, Key_ID,k,n);
       end
end
       
         
         



cc=cell2mat(cc);
bb=bitxor(cc, Key_ID);
% bb=reshape(bb,1,alpha*k);
bb=sort(bb);
bb=setdiff(bb, sent_alpha);
bb_empty=isempty(bb);
if bb_empty==0
 sz_bb=size(bb);
 % I sent the request to alpha nodes -- according to papper but wiki says
 % something else
 if sz_bb(2)>alpha
     min_dist=bb(1,1:alpha);
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
Closet_nodes_after_attack=bitxor(sent_alpha(1,1:k), Key_ID);
else
Closet_nodes_after_attack=bitxor(sent_alpha(1,1:sz_sent_alpha(2)), Key_ID);
end
return
