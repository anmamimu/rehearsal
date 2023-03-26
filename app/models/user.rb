# frozen_string_literal: true

class User < ApplicationRecord
  has_many :notes
  has_many :brief_notes

  authenticates_with_sorcery!
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 }
end
