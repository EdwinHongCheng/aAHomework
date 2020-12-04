# DIY ADTs (W3D5 HW) - Finished
  
# Exercise 1 - Stack
  
class Stack

    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
        @stack
    end

    def pop
        answer = @stack[-1]
        @stack.delete_at(-1)
        answer
    end

    def peek
        @stack[-1]
    end

end

# Tests

# stack = Stack.new
# stack.push("Hello") 
# stack.push("World") 
# p stack.peek #=> "World"
# stack.pop #=> "Hello"
# p stack.peek 
# stack.pop
# p stack.peek #=> nil
# stack.push("Goodbye") #=> "Goodbye"
# p stack.peek


# Exercise 2 - Queue

class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
        @queue
    end

    def dequeue
        answer = @queue[0]
        @queue.delete_at(0)
        answer
    end

    def peek
        @queue[0]
    end

end

# Tests

# q = Queue.new
# q.enqueue("Hello") 
# q.enqueue("World") 
# p q.peek #=> "Hello"
# q.dequeue #=> "World"
# p q.peek 
# q.dequeue
# p q.peek #=> nil
# q.enqueue("Goodbye") #=> "Goodbye"
# p q.peek


# Exercise 3 - Map

class Map

    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |kv_pair|
            if kv_pair[0] == key
                kv_pair[1] = value
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |kv_pair|
            if kv_pair[0] == key
                return kv_pair[1]
            end
        end
        nil
    end

    def delete(key)
        @map.each_with_index do |kv_pair, idx|
            if kv_pair[0] == key
                @map.delete_at(idx)
                return
            end
        end
    end

    def show
        @map
    end

end

# Tests

# map = Map.new
# map.set("1", "Hello") 
# map.set("2", "Goodbye") 
# p map.show #=> [["1", "Hello"], ["2", "Goodbye"]]
# map.set("1", "Kayak")
# p map.show #=> [["1", "Kayak"], ["2", "Goodbye"]]
# p map.get("2") #=> "Goodbye"
# map.delete("2") #=> [["1", "Kayak"]]
# p map.show
# map.delete("777") 
# p map.show #=> [["1", "Kayak"]]
# map.delete("1")
# p map.show #=> []
