# frozen_string_literal: true

class ChangeColumnTypeInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer
  end
end
