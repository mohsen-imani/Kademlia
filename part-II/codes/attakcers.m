function attackers_ID=attakcers(precent_of_attackers,Closet_nodes,node_ID);
attackers_No=round(10*precent_of_attackers);
while_para=0;
while while_para==0;
attackers_i=randperm(1000,attackers_No);
attackers_ID=node_ID(1,attackers_i);
empty=isempty(intersect(attackers_ID,Closet_nodes));
if empty==1
    while_para=1;
end
end
%------must be defined -- kb, Key_ID,alpha,n--------
