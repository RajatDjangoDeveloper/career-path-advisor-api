# frozen_string_literal: true

class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :school_name
      t.string :education_type
      t.string :stream

      t.timestamps
    end
  end
end
