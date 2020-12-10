# Great Video for Reference:
# https://open.appacademy.io/learn/swe-in-person/ruby/errors--equality-matchers--subject-let--and-doubles

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cheese_cake) { Dessert.new("cake", 10, chef) }

  describe "#initialize" do # Finished #initialize
    it "sets a type" do
      expect(cheese_cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cheese_cake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cheese_cake.ingredients).to be_empty
      # Self-Note: can also do the line below:
      # expect(cheese_cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "ten", "Gordon Ramsay") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do # Finished
    it "adds an ingredient to the ingredients array" do
      cheese_cake.add_ingredient("flour")
      expect(cheese_cake.ingredients).to eq(["flour"])
    end
  end

  # using expect(): write the running code example below it
  describe "#mix!" do # Fin, Tricky 
    it "shuffles the ingredient array" do
      expect(cheese_cake.ingredients).to receive(:shuffle!)
      cheese_cake.mix!
    end
  end

  describe "#eat" do # Finished #eat
    it "subtracts an amount from the quantity" do
      cheese_cake.eat(6)
      expect(cheese_cake.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cheese_cake.eat(999) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do # Fin, Tricky
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      cheese_cake.serve
    end
  end

  describe "#make_more" do # Fin, Tricky
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cheese_cake)
      cheese_cake.make_more
    end
  end
end
