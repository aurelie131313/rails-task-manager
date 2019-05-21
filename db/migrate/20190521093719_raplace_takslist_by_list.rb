class ReplaceTaskslistByLists < ActiveRecord::Migration[5.2]
  def change
    drop_table :tasks_lists

    create_table :lists
    add_column :lists, :title, :string
  end
end
