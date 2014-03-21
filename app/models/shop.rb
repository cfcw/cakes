class Shop < ActiveRecord::Base
  attr_accessible :create_user_id, :shop_name, :zip_cd, :address, :phone, :start_time, :end_time, :time_info,
                  :shop_info, :memo1, :memo2
end
