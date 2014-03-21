class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.integer :create_user_id
      t.string :zip_cd
      t.string :address
      t.string :phone
      t.string :start_time
      t.string :end_time
      t.string :time_info
      t.text :shop_info
      t.text :memo1
      t.text :memo2

      t.timestamps
    end
  end
end
