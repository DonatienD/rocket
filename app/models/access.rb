class Access < ApplicationRecord
  belongs_to :profile
  belongs_to :room

  validates :profile_id, presence: true
  validates :room_id, presence: true
end
