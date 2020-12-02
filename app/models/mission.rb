class Mission < ApplicationRecord
  belongs_to :chapter
  belongs_to :user

  has_many :flashcards, dependent: :destroy

  validates :name, presence: true
  validates :chapter_id, presence: true
  validates :user_id, presence: true
end
