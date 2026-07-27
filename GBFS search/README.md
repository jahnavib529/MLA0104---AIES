Algorithm GreedyBestFirstSearch(Graph, Heuristic, Start, Goal)

Input: Graph, Heuristic values, Start node, Goal node
Output: Path to the Goal node

1. Visited ← empty list
2. Queue ← [(Start, Heuristic[Start])]     

3. While Queue is not empty do
       Sort Queue in ascending order of Heuristic value
       (Current, HValue) ← Remove first element from Queue
       If Current is in Visited then
            Continue
       End If
       Append Current to Visited
       Print Current
       If Current = Goal then
            Print "Goal found"
            Stop
       End If
       For each (Neighbor, Cost) in Graph[Current] do
            If Neighbor is not in Visited then
                 Append (Neighbor, Heuristic[Neighbor]) to Queue
            End If
       End For

   End While

4. Print "Goal not found"

End Algorithm
