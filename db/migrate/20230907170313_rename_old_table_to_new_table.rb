class RenameOldTableToNewTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :assesment_tables, :assesments
    rename_table :education_tables, :educations
  end 
end
