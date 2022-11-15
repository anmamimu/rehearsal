class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :song_title, :singer_name, length: { maximum: 50 }
end
