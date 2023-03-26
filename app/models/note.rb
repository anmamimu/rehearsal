# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :note_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :note_hashtag_relations

  validates :song_title, :singer_name, length: { maximum: 50 }

  mount_uploader :audio, AudiofileUploader

  after_create do
    note = Note.find_by(id:)
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/)
    note.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      note.hashtags << tag
    end
  end

  before_update do
    note = Note.find_by(id:)
    note.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      note.hashtags << tag
    end
  end
end
