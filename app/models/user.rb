class User < ActiveRecord::Base
  has_many :reputations
  
  attr_accessible :address, :email, :first_name, :gender, :image_url, :last_name, :passwd
  
  # 
  # ログイン名
  #  
  def login_name
      login_name = attributes["last_name"] + " " + attributes["first_name"] 
  end
  
  # 
  # 認証処理
  #  
  def self.authenticate(email, passwd)
    where(:email => email, :passwd => passwd).first
  end
end
