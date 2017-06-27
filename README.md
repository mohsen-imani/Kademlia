# Kademlia

This simulation has been written in Matlab and simulates Kademlia which is a DHT for decentralized peer to peer networks. Kademlia uses exclusive OR to calculate distance between two node IDs. Key IDs have  the same format as Node IDs. We’ve used a random function to generate these unique IDs. A Kademlia node organizes its contacts (includes: Node ID, IP address, Port) and other nodes known to it in buckets that keep a maximum of k contacts. These are known as k-buckets. The buckets are organized by the distance between the node and the contacts in the bucket. The quantity of simultaneous lookups is denoted by α which is typically 3. A node initiates a FIND_NODE request by querying to α nodes in its own k-buckets that are the closest ones to the desired key. When these recipient nodes receive the request, they will look in their k-buckets and return the k closest nodes to the desired key that they know. The requester will update the result list with the results (the node IDs) he receives, keeping the k best ones, the k nodes that are closer to the searched key and responded to queries. Then the requester will select these k best results and issue the request to them, and iterate this process again and again. Because each node has a better knowledge of his own surroundings than any other node, the received results will be other nodes that are  closer to the searched key. The iterations continue until no nodes are returned that are closer than the best previous results. When the iterations stop, the best k nodes in the results list are the ones in the whole network that are the closest to the desired key. Our program includes: 

1- KB.m : It gets the Node ID and creates K-buckets for the corresponding node. 

2- FNR.m: In this function we can find the closest nodes to the key in k-buckets of a given node. The number of the closest nodes is n, which is equal to the alpha in the first phase and after that it’ll be equal to the k. 

3- Lookups.m: in this file we determine the number of nodes (which should be 1000), desired key (line 5) and the node ID (line 6). The output will be the closest nodes in the network to the desired key. 
