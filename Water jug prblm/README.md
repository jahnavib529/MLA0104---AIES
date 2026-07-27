Algorithm WaterJug(Capacity1, Capacity2, Target)

Input: Capacity1, Capacity2, Target amount
Output: Steps to reach the Target amount

1. Visited ← empty list
2. Queue ← [(0, 0)]      

3. While Queue is not empty do
       State ← Remove first element from Queue
       If State is in Visited then
            Continue
       End If
       Append State to Visited
       (X, Y) ← State
       Print State
       If X = Target OR Y = Target then
            Print "Target reached"
            Stop
       End If
       NextStates ←
            (Capacity1, Y)                          
            (X, Capacity2)                          
            (0, Y)                                  
            (X, 0)                                  
            (max(0, X - (Capacity2 - Y)),
             min(Capacity2, Y + X))                 
            (min(Capacity1, X + Y),
             max(0, Y - (Capacity1 - X)))        
       For each NextState in NextStates do
            If NextState is not in Visited
               AND NextState is not in Queue then
                  Append NextState to Queue
            End If
       End For

   End While

4. Print "No solution found"

End Algorithm
