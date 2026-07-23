Algorithm UniformCostSearch(Graph, Start, Goal)

Input: Graph, Start node, Goal node
Output: Minimum cost to reach Goal

1. Visited ← empty list
2. Queue ← [(0, Start)]      

3. While Queue is not empty do
       Sort Queue in ascending order of Cost
       (Cost, Node) ← Remove first element from Queue
       If Node is not in Visited then
            Append Node to Visited
            If Node = Goal then
                 Print Node
                 Print Cost
                 Stop
            End If
            For each (Neighbor, EdgeCost) in Graph[Node] do
                 If Neighbor is not in Visited then
                      Append (Cost + EdgeCost, Neighbor) to Queue
                 End If
            End For
       End If
   End While
5. Print "Goal not found"
End Algorithm
