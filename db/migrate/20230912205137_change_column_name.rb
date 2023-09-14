class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    change_column :assesments, :hobbies, :string, null: true
    change_column :assesments, :skills, :string, null: true
    change_column :assesments, :intrest, :string, null: true
    change_column :educations, :school_name, :string, null: true
    change_column :educations, :education_type, :string, null: true
    change_column :educations, :stream, :string, null: true
    change_column :users, :name, :string, null: true
  end
end
