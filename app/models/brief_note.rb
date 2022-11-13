class BriefNote < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 30000 } 
end
