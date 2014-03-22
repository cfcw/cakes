#coding: utf-8
# MypageController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.22
class MypageController < SessionController
  #
  # MyPage表示処理
  #
  def main
    #パラメータ取得
    @keywords = SearchKeyword.new(params)
    
    #お勧め商品取得
    sql = generate_recommended_sql(@keywords)
    @recommended_items = Item.find_by_sql([sql, @keywords.params])
    
    #ランキング商品取得
    sql = generate_ranking_sql(@keywords)
    @ranking_items  = Item.find_by_sql([sql, @keywords.params])
    
    #近所商品取得
    sql = generate_near_by_sql(@keywords)
    @near_by_items  = Item.find_by_sql([sql, @keywords.params])
  end
  
  #
  # お勧め商品取得
  #  
  def generate_recommended_sql(keywords)
    sql = "select id item_id, 
                  item_name item_name,
                  image_url image_url
             from items I 
            where recommended_flg = 1"
    unless keywords.item_name.empty?
      sql = sql + " and item_name = :item_name "
    end
    unless keywords.category_id.empty?
      sql = sql + " and category_id = :category_id "
    end
    unless keywords.target_gender_id.empty?
      sql = sql + " and target_gender_id = :target_gender_id "
    end
    unless keywords.target_age_id.empty?
      sql = sql + " and target_age_id = :target_age_id "
    end
    sql =  sql +  " limit 4 "
    return sql
  end

  #
  # ランキング商品取得
  #
  def generate_ranking_sql(keywords)
    sql = "select id item_id, 
                  item_name item_name, 
                  rank rank,
                  image_url image_url
             from items I 
            where 1 = 1 "
    unless keywords.item_name.empty?
      sql = sql + " and item_name = :item_name "
    end
    unless keywords.category_id.empty?
      sql = sql + " and category_id = :category_id "
    end
    unless keywords.target_gender_id.empty?
      sql = sql + " and target_gender_id = :target_gender_id "
    end
    unless keywords.target_age_id.empty?
      sql = sql + " and target_age_id = :target_age_id "
    end
    sql = sql + " order by rank limit 4 "
    return sql    
  end

  #
  # 近所商品取得
  #
  def generate_near_by_sql(keywords)
    sql = "select id item_id, 
                  item_name item_name,
                  near_by_flg near_by_flg, 
                  image_url image_url
             from items I 
            where near_by_flg > 1 "
    unless keywords.item_name.empty?
      sql = sql + " and item_name = :item_name "
    end
    unless keywords.category_id.empty?
      sql = sql + " and category_id = :category_id "
    end
    unless keywords.target_gender_id.empty?
      sql = sql + " and target_gender_id = :target_gender_id "
    end
    unless keywords.target_age_id.empty?
      sql = sql + " and target_age_id = :target_age_id "
    end
    sql = sql + " order by near_by_flg limit 4 "
     return sql  
  end
end
