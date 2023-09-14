class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :last_education
      t.string :second_last_education
      t.column :gender, :enum, default: 'other', null: false
      t.date :dob

      t.timestamps
    end
  end
end
