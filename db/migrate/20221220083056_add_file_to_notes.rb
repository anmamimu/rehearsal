# frozen_string_literal: true

class AddFileToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :audio, :string
  end
end
