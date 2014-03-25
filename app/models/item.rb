class Item < ActiveRecord::Base
  belongs_to :shop
  has_many :reputations
  
  attr_accessible :item_name, :shop_id, :category_id, :target_gender_id, :target_age_id, :image_url, 
                  :comment1, :comment2, :price, :memo1, :memo2, :recommended_flg, :rank, :near_by_flg
end
