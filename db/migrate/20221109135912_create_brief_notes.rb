# frozen_string_literal: true

class CreateBriefNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :brief_notes do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
