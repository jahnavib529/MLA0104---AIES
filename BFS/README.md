Algorithm BFS(Graph, Start)

Input: Graph, Start node
Output: Breadth-First traversal of the graph

1. Visited ← empty list
2. Queue ← empty list

3. Append Start to Visited
4. Append Start to Queue

5. While Queue is not empty do
       Node ← Remove first element from Queue
       Print Node

       For each Neighbor in Graph[Node] do
            If Neighbor is not in Visited then
                 Append Neighbor to Visited
                 Append Neighbor to Queue
            End If
       End For
   End While

End Algorithm
