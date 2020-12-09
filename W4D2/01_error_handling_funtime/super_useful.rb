# PHASE 2 - Finished 

# Self-Note: heavily referenced Solutions for Phase 2

FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "Coffee? Don't mind if I do! ... *burp* That's the stuff! ...I could use some fruit now. ;)"
  end
end

class NotAFruitError < StandardError
  def message
    "Are you daft? I only consume fruits and coffee. Go away!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotAFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotAFruitError => e
    puts e.message
  end
end  


# PHASE 3 - Finished
class BestFriend
  def initialize(name, yrs_known, fav_pastime)

    raise ArgumentError.new("Pal, how can we be besties if I don't even know your name?.") if name.length <= 0
    raise ArgumentError.new("Hold up! We haven't known each other long enough to be best buds!") if yrs_known < 5
    raise ArgumentError.new("Friend, if we are to be best buds, I need to know your favorite pastime.") if fav_pastime.length <= 0
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


