def dfs(graph, node, visited):
    if node not in visited:
        print(node, end=" ")
        visited.append(node)

        for neighbor in graph[node]:
            dfs(graph, neighbor, visited)

# Example graph
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

visited = []
dfs(graph, 'A', visited)
