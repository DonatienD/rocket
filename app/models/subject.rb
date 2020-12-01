class Subject < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :chapters

  validates :name, presence: true
  validates :user_id, presence: true
end
