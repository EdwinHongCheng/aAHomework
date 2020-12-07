# Graph Nodes and BFS (W4D1 HW)
# Source Link: 
# https://open.appacademy.io/learn/swe-in-person/ruby/graph-nodes-and-bfs

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    # overwriting the default inspect to display info better
    def inspect
        @value
    end

    # WIP
    def bfs(starting_node, target_value)
        visited_nodes = []

        queue = [starting_node]

        while !queue.empty?
            current_node = queue.shift

            if !visited_nodes.include?(current_node)
                visited_nodes << current_node
                return current_node if current_node.value == target_value
                queue += current_node.neighbors
            end
        end

        nil
    end
    
end

# Tests

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, "b") #=> b
p a.bfs(a, "f") #=> nil
p c.bfs(c, "d") #=> d
p f.bfs(f, "d") #=> d
p e.bfs(e, "f") #=> nil
