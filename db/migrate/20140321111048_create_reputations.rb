class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.references :shop
      t.references :item
      t.references :user
      t.string :reputation
      t.integer :rank

      t.timestamps
    end
    add_index :reputations, :shop_id
    add_index :reputations, :item_id
    add_index :reputations, :user_id
  end
end
