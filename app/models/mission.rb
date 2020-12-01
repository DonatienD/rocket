class Mission < ApplicationRecord
  belongs_to :chapter

  has_many :flashcards, dependent: :destroy

  validates :name, presence: true
  validates :chapter_id, presence: true
end
