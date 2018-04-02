class AddProjectForeignKeyToTasksTable < ActiveRecord::Migration[5.1]
  def up
    add_reference :tasks, :project, index: true
    add_foreign_key :tasks, :projects
  end

  def down
    remove_foreign_key :tasks, :projects
    remove_reference :tasks, :project
  end
end
