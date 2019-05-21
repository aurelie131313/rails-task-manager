class TableTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks
    add_column :tasks, :title, :string
    add_column :tasks, :description, :text
    add_column :tasks, :ongoing, :boolean
    add_column :tasks, :important, :boolean
    add_column :tasks, :list_id, :integer
    add_index :tasks, :list_id

    create_table :tasks_lists
    add_column :tasks_lists, :title, :string
  end
end
