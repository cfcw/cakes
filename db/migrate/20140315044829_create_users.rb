class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :passwd
      t.string :email
      t.integer :gender
      t.string :address
      t.text :image_url

      t.timestamps
    end
  end
end
