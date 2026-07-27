Algorithm AStar(Graph, Heuristic, Start, Goal)

Input: Graph, Heuristic values, Start node, Goal node
Output: Shortest path cost to reach Goal

1. OpenList ← [(Start, 0)]    
2. GCost[Start] ← 0
3. Visited ← empty list

4. While OpenList is not empty do
       Sort OpenList in ascending order of f_cost
       (Current, f_cost) ← Remove first element from OpenList
       If Current is in Visited then
            Continue
       End If
       Append Current to Visited
       If Current = Goal then
            Print "Goal found"
            Print GCost[Current]
            Stop
       End If
       For each (Neighbor, Cost) in Graph[Current] do
            NewCost ← GCost[Current] + Cost
            If Neighbor is not in GCost
               OR NewCost < GCost[Neighbor] then
                  GCost[Neighbor] ← NewCost
                  FCost ← NewCost + Heuristic[Neighbor]
                  Append (Neighbor, FCost) to OpenList
            End If
       End For

   End While

5. Print "Goal not found"

End Algorithm
