### Shortest Path Algorithms for Weighted Graphs
Minimum Spanning Tree: A graph with the least number of edges that is fully connected, but has no cycles, and the lowest weight path through all nodes.

Tree: A fully connected graph with the minimum number of edges
##### Kruskall's MST Algorithm
Create an edge list of structs/tuples with edges, and their weights. O(E)
Sort the edge list in ascending order of edge weights. O(E log E)
Add edges from cheapest to most expensive.
**Try to be greedy but do not create cycles**
To detect cycles, create an array to track connections and an array to track how many subtrees exist currently
If 2 items are a part of the same tree, connecting them will make a cycle.
If an item is "-1" in the connection tracker array, it has not been connected to anything yet.
Stop when all there are no isolated vertices.

##### Floyds Shortest Path Algorithm

