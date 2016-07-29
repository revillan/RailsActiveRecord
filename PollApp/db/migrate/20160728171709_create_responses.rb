class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_choices_id, null: false
      t.integer :poll_id, null: false

      t.timestamps null: false
    end

    add_index :responses, :answer_choices_id
    add_index :responses, :poll_id
  end
end
