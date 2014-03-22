#coding: utf-8
# MypageController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.21
class MypageController < SessionController
  def main
    #お勧め商品取得
    sql = "select id item_id, 
                  item_name item_name,
                  image_url image_url
             from items I 
            where recommended_flg = 1
            limit 4 "
    @recommended_items = Item.find_by_sql(sql)
    
    #ランキング商品取得
    sql = "select id item_id, 
                  item_name item_name, 
                  rank rank,
                  image_url image_url
             from items I
            order by rank
            limit 4 "
    @ranking_items  = Item.find_by_sql(sql)
    
    #近所商品取得
    sql = "select id item_id, 
                  item_name item_name,
                  near_by_flg near_by_flg, 
                  image_url image_url
             from items I 
            where near_by_flg > 1
            order by near_by_flg
            limit 4 "
    @near_by_items  = Item.find_by_sql(sql)
  end
end
