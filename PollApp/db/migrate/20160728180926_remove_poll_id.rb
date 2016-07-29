class RemovePollId < ActiveRecord::Migration
  def change
    remove_column :responses, :poll_id
  end
end
