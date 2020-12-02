class Room < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :accesses, dependent: :destroy

  validates :subject_id, presence: true
  validates :user_id, presence: true
end
