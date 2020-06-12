class CreateGroupMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :group_messages do |t|
      t.integer :event_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
