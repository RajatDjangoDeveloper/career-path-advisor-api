# frozen_string_literal: true

class CreateAssesments < ActiveRecord::Migration[7.0]
  def change
    create_table :assesments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :hobbies
      t.string :skills
      t.string :intrest

      t.timestamps
    end
  end
end
