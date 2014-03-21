class Item < ActiveRecord::Base
  belongs_to :shop
  has_many :reputations
  
  attr_accessible :item_name
end
