class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name

      t.timestamps
    end
  end
end
