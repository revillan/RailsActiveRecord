class AddUserColumn < ActiveRecord::Migration
  def change
    add_column :responses, :user_id, :integer, null: false
    add_index :responses, :user_id
  end
end
