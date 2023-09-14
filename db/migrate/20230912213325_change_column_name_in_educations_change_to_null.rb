class ChangeColumnNameInEducationsChangeToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :educations, :education_type, false, Time.now
    change_column_null :educations, :school_name, false, Time.now
    change_column_null :educations, :stream, false, Time.now
  end
end
