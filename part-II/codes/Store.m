
function stored_Keys_ID=Store(stored_Keys_ID,Closet_nodes, node_ID)
i_marix=[];
Closet_nodes=unique(Closet_nodes);
sz=size(Closet_nodes);
for i=1:sz(2);
    i_matrix(i)=find(node_ID==Closet_nodes(i));
end
  
for i=1:sz(2);
    a=isempty(stored_Keys_ID{i_matrix(i)});
    sz2=size(stored_Keys_ID{i_matrix(i)});
    stored_Keys_ID{i_matrix(i)}(sz2(2)+1)=Closet_nodes(i);
end
    return
    