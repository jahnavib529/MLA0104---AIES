def uniform_cost_search(graph, start, goal):
    visited = []
    queue = [(0, start)]  

    while queue:
       
        queue.sort(key=lambda x: x[0])

        cost, node = queue.pop(0)

        if node not in visited:
            visited.append(node)

            if node == goal:
                print("Goal found:", node)
                print("Total Cost:", cost)
                return

            for neighbor, edge_cost in graph[node]:
                if neighbor not in visited:
                    queue.append((cost + edge_cost, neighbor))

    print("Goal not found")
graph = {
    'A': [('B', 1), ('C', 4)],
    'B': [('D', 2), ('E', 5)],
    'C': [('F', 1)],
    'D': [],
    'E': [('F', 1)],
    'F': []
}
uniform_cost_search(graph, 'A', 'F')
