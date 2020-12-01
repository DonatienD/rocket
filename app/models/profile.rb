class Profile < ApplicationRecord
  belongs_to :user
  has_many :accesses
  has_many :rooms, through: :accesses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true, inclusion: { in: %w(Mr Mme) }
  validates :user_id, presence: true
end
