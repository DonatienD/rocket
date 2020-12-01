class Flashcard < ApplicationRecord
  belongs_to :mission

  validates :question, presence: true
  validates :answer, presence: true
  validates :mission_id, presence: true
end
