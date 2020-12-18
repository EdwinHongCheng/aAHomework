# Phase 2

class Person < ApplicationRecord
  validates :name, :house, presence: true

  # Phase 3
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House
end
