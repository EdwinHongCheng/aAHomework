# Phase 2

class House < ApplicationRecord
  validates :address, presence: true

  # Phase 3
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Person
end