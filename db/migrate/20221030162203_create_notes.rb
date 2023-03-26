# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :song_title
      t.string :singer_name
      t.text :hashbody
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
