# frozen_string_literal: true

class ChangeColumnNameInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, default: 'user'
  end
end
