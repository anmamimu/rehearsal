class NoteHashtagRelation < ApplicationRecord
  belongs_to :note
  belongs_to :hashtag

  with_options presence: true do
    validates :note_id
    validates :hashtag_id
  end
end
