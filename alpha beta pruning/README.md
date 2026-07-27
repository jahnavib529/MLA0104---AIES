Algorithm AlphaBeta(Depth, NodeIndex, IsMax, Values, Alpha, Beta, MaxDepth)

Input: Current Depth, Node Index, Player Type,
       Leaf Node Values, Alpha, Beta, Maximum Depth
Output: Optimal Value

1. If Depth = MaxDepth then
       Return Values[NodeIndex]
   End If

2. If IsMax = True then
       Best ← -∞
       For i ← 0 to 1 do
            Value ← AlphaBeta(Depth + 1,NodeIndex × 2 + i,False,Values,Alpha,Beta,MaxDepth)
            Best ← max(Best, Value)
            Alpha ← max(Alpha, Best)
            If Beta ≤ Alpha then
                 Break
            End If
       End For
       Return Best

3. Else
       Best ← +∞
       For i ← 0 to 1 do
            Value ← AlphaBeta(Depth + 1,NodeIndex × 2 + i,True,Values,Alpha,Beta,MaxDepth)
            Best ← min(Best, Value)
            Beta ← min(Beta, Best)
            If Beta ≤ Alpha then
                 Break
            End If
       End For
       Return Best
End Algorithm
