class ChangeColumnNameInUserChangeToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, false, Time.now
  end
end
