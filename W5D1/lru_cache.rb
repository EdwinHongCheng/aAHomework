class LRUCache
    def initialize(cache_size)
        @cache = Array.new
        @cache_size = cache_size
    end

    def count
        # returns number of elements currently in cache
        cache.count
    end
    
    def add(el) # Time Complexity: O(n)
        # adds element to cache according to LRU principle

        if cache.include?(el) # Array#include?(el) = O(n)

            # 1. el is in cache already, and whether cache is full or not:
            # delete el at old location, then add el to the back

            cache.delete(el) # Array#delete(el) = O(n)
            cache << el
        elsif count >= cache_size
            # 2. cache is full, and el isn't in cache yet:
            # delete LRU element (aka at index 0), then add el to back

            cache.shift # Array#shift - O(n), since we need to change all array indices
            cache << el
        else
            # 3. cache isn't full, and el isn't in cache yet:
            # simply add el to back
            cache << el
        end
        
    end

    def show
        # shows the items in the cache, with the LRU item first
        p cache
    end

    private
    # helper methods go here!
    
    attr_reader :cache, :cache_size
end


# Tests

johnny_cache = LRUCache.new(4) # #<LRUCache:0x00007fe8c68f3548 @cache=[], @cache_size=4>

johnny_cache.add("I walk the line") # ["I walk the line"]
johnny_cache.add(5) # ["I walk the line", 5]

p johnny_cache.count  # => returns 2

johnny_cache.add([1,2,3]) # ["I walk the line", 5, [1, 2, 3]]
johnny_cache.add(5) # ["I walk the line", [1, 2, 3], 5]
johnny_cache.add(-5) # ["I walk the line", [1, 2, 3], 5, -5]
johnny_cache.add({a: 1, b: 2, c: 3}) # [[1, 2, 3], 5, -5, {:a=>1, :b=>2, :c=>3}]
johnny_cache.add([1,2,3,4]) # [5, -5, {:a=>1, :b=>2, :c=>3}, [1, 2, 3, 4]]
johnny_cache.add("I walk the line") # [-5, {:a=>1, :b=>2, :c=>3}, [1, 2, 3, 4], "I walk the line"]
johnny_cache.add(:ring_of_fire) # [{:a=>1, :b=>2, :c=>3}, [1, 2, 3, 4], "I walk the line", :ring_of_fire]
johnny_cache.add("I walk the line") # [{:a=>1, :b=>2, :c=>3}, [1, 2, 3, 4], :ring_of_fire, "I walk the line"]
johnny_cache.add({a: 1, b: 2, c: 3}) # [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

johnny_cache.show   # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
