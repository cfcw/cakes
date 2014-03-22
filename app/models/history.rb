class History < ActiveRecord::Base
  belongs_to :user
  attr_accessible :action, :ip_address, :user_name
end
