class Room < ApplicationRecord
  belongs_to :matiere
  belongs_to :teacher
  belongs_to :user
  has_many :chapters
  has_many :accesses

  validates :matiere_id, presence: true
  validates :user_id, presence: true
end
