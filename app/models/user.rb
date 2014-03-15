class User < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :gender, :image_url, :last_name, :passwd
end
