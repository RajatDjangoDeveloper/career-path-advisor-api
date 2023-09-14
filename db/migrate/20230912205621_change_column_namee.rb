class ChangeColumnNamee < ActiveRecord::Migration[7.0]
  class ChangeColumnName < ActiveRecord::Migration[7.0]
    def change
      change_column :assesments, :hobbies, :string, null: false
      change_column :assesments, :skills, :string, null: false
      change_column :assesments, :intrest, :string, null: false
      change_column :educations, :school_name, :string, null: false
      change_column :educations, :education_type, :string, null: false
      change_column :educations, :stream, :string, null: false
      change_column :users, :name, :string, null: false
    end
  end
end
