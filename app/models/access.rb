class Access < ApplicationRecord
  belongs_to :student
  belongs_to :room

  validates :room_id, presence: true
  validates :student_id, presence: true
end
