class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :accesses, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :flashcards, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :rooms, through: :accesses
  has_many :subjects, dependent: :destroy
end
