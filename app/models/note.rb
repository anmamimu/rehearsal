class Note < ApplicationRecord
  belongs_to :user

  validates :song_title, :singer_name, length: { maximum: 50 }
  validates :take_note, length: { maximum: 30000 } 
end
