class Group < ActiveRecord::Base
  belongs_to :create_user_id
  attr_accessible :group_name
end
