class Matiere < ApplicationRecord
  has_one :room
  has_one :chapter

  validates :name, presence: true
end
