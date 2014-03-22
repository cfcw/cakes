class SearchKeyword 
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  
  attr_accessor :item_name, :category_id, :target_gender_id, :target_age_id
  
  def initialize(params = {})
    self.item_name = params[:item_name] if params
    self.category_id = params[:category_id] if params
    self.target_gender_id = params[:target_gender_id] if params
    self.target_age_id = params[:target_age_id] if params

  end
  
  def params
      hash = {}
    unless self.item_name.nil?
      hash.store(:item_name, self.item_name) 
    end  
    unless self.category_id.nil?
      hash.store(:category_id, self.category_id) 
    end  
    unless self.target_gender_id.nil?
      hash.store(:target_gender_id, self.target_gender_id) 
    end  
    unless self.target_age_id.nil?
      hash.store(:target_age_id, self.target_age_id) 
    end  
    return hash
  end
  
  def persisted?
    false
  end
  
  
end
