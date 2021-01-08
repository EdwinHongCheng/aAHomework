class Toy < ApplicationRecord

  # Phase 1: Create Polymorphic Associations

  belongs_to :toyable, polymorphic: true
  validates :name, uniqueness: { scope: [:toyable] }
end
