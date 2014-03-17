class CreateTargetAges < ActiveRecord::Migration
  def change
    create_table :target_ages do |t|
      t.string :target_age_range

      t.timestamps
    end
  end
end
