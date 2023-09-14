class ChangeSkillsInAssesments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :assesments, :skills, false, Time.now
  end
end
