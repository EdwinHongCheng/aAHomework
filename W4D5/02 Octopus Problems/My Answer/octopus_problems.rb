# Octopus Problems (W4D5 HW)

# Finished: the day before W4D5


# array of fishes of different string lengths
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# 1. Sluggish Octopus

# uses Bubble Sort - O(n^2) time
def sluggish_octopus(arr)
    bubble_sort(arr)[-1]
end

# Helper Method: Bubble Sort
# Time Complexity: O(n^2) time
def bubble_sort(arr)
    arr_copy = arr.dup

    sorted = false

    while !sorted
        sorted = true

        (0...arr.length - 1).each do |i|
            if arr_copy[i].length > arr_copy[i + 1].length
                arr_copy[i], arr_copy[i + 1] = arr_copy[i + 1], arr_copy[i]
                sorted = false
            end
        end
    end

    arr_copy
end

# Test
# p sluggish_octopus(fishes) #=> "fiiiissshhhhhh"



# 2. Dominant Octopus

# Self-Note: using Merge Sort over Quick Sort
# Quick Sort's Time Complexity: worst case scenario: O(n^2), average case: O(n log n)

def dominant_octopus(arr)
    merge_sort(arr)[-1]
end

# Merge Sort - Time Complexity: O(n log n)
def merge_sort(arr)
    return arr if arr.length <= 1

    middle_idx = (arr.length / 2) - 1

    left = arr[0..middle_idx]
    right = arr[middle_idx + 1..-1]

    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    merge(sorted_left, sorted_right)
end

# Helper Method
def merge(arr1, arr2)
    answer = []

    while !arr1.empty? && !arr2.empty?
        if arr1[0].length < arr2[0].length
            answer << arr1.shift
        elsif arr2[0].length < arr1[0].length
            answer << arr2.shift
        else
            answer << arr1.shift
            answer << arr2.shift
        end
    end

    answer + arr1 + arr2
end


# Test
# p dominant_octopus(fishes) #=> "fiiiissshhhhhh"



# 3. Clever Octopus

# Time Complexity: O(n) time
def clever_octopus(arr)
    longest_str = ""

    arr.each do |word|
        if word.length > longest_str.length
            longest_str = word
        end
    end

    longest_str
end

# Test
# p clever_octopus(fishes) #=> "fiiiissshhhhhh"



# 4. Dancing Octopus (Both Parts)

# 4a. Slow Dance

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Time Complexity: O(n) time
def slow_dance(target_tile, tiles_arr)
    tile_idx = nil

    tiles_arr.each_with_index do |tile, idx|
        tile_idx = idx if tile == target_tile
    end

    tile_idx
end

# Tests
# p slow_dance("up", tiles_array) #=> 0
# p slow_dance("right-down", tiles_array) #=> 3



# 4b. Constant Dance!

# Time Complexity: O(1) time

# from Solution: 
# use a hash for constant lookup
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, hash)
  hash[direction]
end

# Tests
# p fast_dance("up", tiles_hash) #=> 0
# p fast_dance("right-down", tiles_hash) #=> 3
