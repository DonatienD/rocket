class Room < ApplicationRecord
  belongs_to :subject
  has_many :chapters, dependent: :destroy
  has_many :accesses, dependent: :destroy

  validates :subject_id, presence: true
end
