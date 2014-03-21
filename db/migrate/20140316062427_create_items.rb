class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :shop
      t.string :item_name
      t.references :category
      t.integer :target_gender_id
      t.text :image_url
      t.string :comment1
      t.string :comment2
      t.integer :price
      t.text :memo1 
      t.text :memo2 
      t.integer :recommended_flg
      t.integer :rank
      t.integer :near_by_flg

      t.timestamps
    end
  end
end
