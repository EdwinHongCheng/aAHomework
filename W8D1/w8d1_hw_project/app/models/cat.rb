class Cat < ApplicationRecord

    # Phase 1: Create Polymorphic Associations

    # has_many :toys, as: :toyable


    # Phase 2: Create a Toyable Concern
    
    include Toyable
end
