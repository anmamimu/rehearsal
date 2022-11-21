class Hashtag < ApplicationRecord
  has_many :note_hashtag_relations, dependent: :destroy
  has_many :notes, through: :note_hashtag_relations

  validates :hashname, presence: true, length: { maximum:99}
end
