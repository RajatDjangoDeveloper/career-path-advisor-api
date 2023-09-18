# frozen_string_literal: true

class DropTableJobs < ActiveRecord::Migration[7.0]
  def change
    drop_table :jobs
  end
end
