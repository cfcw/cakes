class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user
      t.string :user_name
      t.string :action
      t.string :ip_address

      t.timestamps
    end
    add_index :histories, :user_id
  end
end
