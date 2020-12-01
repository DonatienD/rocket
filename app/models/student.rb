class Student < ApplicationRecord
  belongs_to :user
  has_many :accesses
  has_many :rooms, through: :accesses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true
end
