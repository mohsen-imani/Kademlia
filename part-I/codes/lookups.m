% Key_ID, Node_ID, alpha, k
% the part will return the 20 closet nodes to the desired Key 
 node=[1:1000];  %the number of nodes
 alpha=3; %the first 3 closet nodes
 Key_ID=1432; % the key ID;
 Node_ID=8765; % the Node ID
k=20; % the number of K-buckets
i=1;
z=1; 
l=1;
cc=zeros(alpha,k);
kb_space.ID{z}=Node_ID;
kb_space.kB{z}=KB(Node_ID);
min_finder=FNR(kb_space.kB{z}, Key_ID, alpha);
z=z+1;
for j=1:alpha;
    kb_space.ID{z}=min_finder(j);
    kb_space.kB{z}=KB(kb_space.ID{z});
    cc(j,:)=FNR(kb_space.kB{z}, Key_ID,k);
    z=z+1;
end
bb=bitxor(cc, Key_ID);
bb=reshape(bb,1,alpha*k);
bb=sort(bb);
aa=bb(1,1:k);
aa=bitxor(aa, Key_ID);
l=l+1;

for h=1:10;
for ii=1:k;
    kb_space.ID{z}=aa(ii);
    kb_space.kB{z}=KB(aa(ii));
    dd(ii,:)=FNR(kb_space.kB{z}, Key_ID,k);
    z=z+1;
end
bb=bitxor(dd, Key_ID);
bb=reshape(bb,1,k*k);
bb=sort(bb);
aa=bb(1,1:k);
Closet_nodes=bitxor(aa, Key_ID); % the first 20 closed nodes 


end
  
Closet_nodes    

    
    
