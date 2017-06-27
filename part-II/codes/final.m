% starting the parameters 
clear all
clc

node=[1:1000]; % the number of nodes
n=20; % the number of bits
k=25; % the number of nodes returned from each node in looking up
alpha=3; % the number of nodes initiator sends


Failure=[];
Success=[];
for j=1:6;
Fail=0;
Succ=0;
for i=1:100


node_ID = randperm(2^n,1000); % define 1000 random node IDs 
Key_ID=randperm(2^n,1); % define a random Key ID 

%----------------------------------------------------------
%------------------variables--------------------------------
%-----------------------------------------------------------

precent_of_attackers=5*(j-1); % the percentage of attackers

%----------------------------------------------------------
%-----------------------------------------------------------
%-----------------------------------------------------------

% bulding K_Buckets for each node
kb_space=KB(node_ID,n);

%choosing a random node for starting the lookup
 Node_ID=node_ID(randi(1000,1));

% call Lookup function for find the k cloest nodes to the Key ID
%[Number_of_lookups,Closet_nodes]=Lookup(kb_space, node_ID,Node_ID,Key_ID,n,k,alpha)

[Number_of_lookups,Closet_nodes]=Lookup(kb_space, node_ID,Node_ID,Key_ID,n,k,alpha);

%Storing the key ID in closet node
% at first we need to build an space for saving the Key IDs
stored_Keys_ID=[];
for z=1:1000;
    stored_Keys_ID{z}=[];
end

stored_Keys_ID=Store(stored_Keys_ID,Closet_nodes, node_ID);

%-----------------------------------------------------------
%------------The attack on Kademlia-------------------------
%-----------------------------------------------------------


attackers_ID=attakcers(precent_of_attackers,Closet_nodes,node_ID); % defining attackers

% looking up under attack
[Number_of_lookups_after_attack,Closet_nodes_after_attack]=Lookup_atk(kb_space, attackers_ID,node_ID,Node_ID,Key_ID,n,k,alpha);

%--------------------------------------------------------------------------
% -------------------The evaluation of successing the lookup---------------
%--------------------------------------------------------------------------

unique_Closet_nodes=unique(Closet_nodes);
unique_Closet_nodes_after_attack=unique(Closet_nodes_after_attack);
intersect_Closet_nodes_attackers=intersect(unique_Closet_nodes,unique_Closet_nodes_after_attack);
empty_intersect_atk=isempty(intersect_Closet_nodes_attackers);
sz_inter=size(intersect_Closet_nodes_attackers);

if sz_inter(2)>5;
%     disp('Lookup successed')
    Succ=Succ+1;
else 
%     disp('Lookup failed')
    Fail=Fail+1;
end
% if unique_Closet_nodes==unique_Closet_nodes_after_attack;
% %     disp('Lookup successed')
%     Succ=Succ+1;
% else 
% %     disp('Lookup failed')
%     Fail=Fail+1;
% end
end
Failure(j)=Fail;
Succuss(j)=Succ;
end
plot(5*[0:5],Succuss);
title('Percentage Success lookups with redundancy=2');
xlabel('Percentage malicious nodes');
ylabel('Percentage Success lookups');

