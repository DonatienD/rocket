class Flashcard < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  validates :question, presence: true
  validates :answer, presence: true
  validates :mission_id, presence: true
  validates :user_id, presence: true
end
