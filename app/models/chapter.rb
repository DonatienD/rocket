class Chapter < ApplicationRecord
  belongs_to :subject
  belongs_to :room
  belongs_to :user

  has_many :missions, dependent: :destroy
  has_many :flashcards, through: :missions

  validates :name, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :subject_id, presence: true
end
