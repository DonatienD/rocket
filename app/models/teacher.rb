class Teacher < ApplicationRecord
  belongs_to :user
  has_many :rooms

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true, inclusion: { in: %w(Mr Mme) }
  validates :user_id, presence: true
end
