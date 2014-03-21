class Reputation < ActiveRecord::Base
  belongs_to :shop
  belongs_to :item
  belongs_to :user
  attr_accessible :rank, :reputation
end
