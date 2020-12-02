class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :subjects
  has_many :rooms
  has_many :chapters
  has_many :missions
  has_many :flashcards
  has_many :accesses
end
