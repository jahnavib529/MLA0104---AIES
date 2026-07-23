Algorithm DFS_Traversal(Graph, Start)

1. Visited ← empty list
2. DFS(Graph, Start, Visited)

Algorithm DFS(Graph, Node, Visited)

1. If Node is not in Visited then
       Print Node
       Append Node to Visited

       For each Neighbor in Graph[Node] do
            DFS(Graph, Neighbor, Visited)
       End For
   End If

End Algorithm
