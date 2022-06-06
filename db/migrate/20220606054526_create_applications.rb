class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :token, null: false
      t.string :name, null: false
      t.integer :chats_count, null: false, defaults: 0

      t.timestamps
    end
    add_index :applications, :token, unique: true
  end
end
