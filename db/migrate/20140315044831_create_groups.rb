class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :create_user_id

      t.timestamps
    end
    add_index :groups, :create_user_id
  end
end
