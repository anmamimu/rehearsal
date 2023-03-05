class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :note_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :note_hashtag_relations

  validates :song_title, :singer_name, length: { maximum: 50 }

  mount_uploader :audio, AudiofileUploader

  def self.ransackable_attributes(auth_object = nil)
    ["song_title", "singer_name"]
  end

  after_create do
    note = Note.find_by(id: self.id)
    hashtags  = self.hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/)
    note.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      note.hashtags << tag
    end
  end

  before_update do 
    note = Note.find_by(id: self.id)
    note.hashtags.clear
    hashtags = self.hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      note.hashtags << tag
    end
  end
end
