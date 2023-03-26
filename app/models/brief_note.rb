# frozen_string_literal: true

class BriefNote < ApplicationRecord
  belongs_to :user

  validates :body, length: { maximum: 140 }
end
