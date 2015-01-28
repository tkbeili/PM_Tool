class AddColumnDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :details, :text
  end
end
