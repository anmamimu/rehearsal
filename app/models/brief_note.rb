class BriefNote < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 30000 } 
end
