def water_jug(capacity1, capacity2, target):
    visited = []
    queue = [(0, 0)]

    while queue:
        state = queue.pop(0)

        if state in visited:
            continue

        visited.append(state)

        x, y = state
        print(state)

        if x == target or y == target:
            print("Target reached!")
            return
        next_states = [
            (capacity1, y),                    
            (x, capacity2),                    
            (0, y),                            
            (x, 0),                           
            (max(0, x - (capacity2 - y)), min(capacity2, y + x)), 
            (min(capacity1, x + y), max(0, y - (capacity1 - x)))   
        ]

        for next_state in next_states:
            if next_state not in visited and next_state not in queue:
                queue.append(next_state)

    print("No solution found")
water_jug(4, 3, 2)
