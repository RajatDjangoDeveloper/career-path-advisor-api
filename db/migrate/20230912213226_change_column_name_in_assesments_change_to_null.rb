class ChangeColumnNameInAssesmentsChangeToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :assesments, :hobbies, false, Time.now
    change_column_null :assesments, :intrest, false, Time.now
  end
end
