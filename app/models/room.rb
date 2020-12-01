class Room < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :accesses

  validates :subject_id, presence: true
end
