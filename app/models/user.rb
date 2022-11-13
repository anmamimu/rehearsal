class User < ApplicationRecord
  has_many :notes
  has_many :brief_note

  authenticates_with_sorcery!
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
