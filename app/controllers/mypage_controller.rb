#coding: utf-8
# MypageController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.21
class MypageController < ApplicationController

  def main
    #お勧め商品取得
    sql = "select item_name item_name 
             from items I "
    @recomennded_items = Item.find_by_sql(sql)
    
    #ランキング商品取得
    @ranking_items  = Item.find_by_sql(sql)
    
    #近所商品取得
    @near_by_items  = Item.find_by_sql(sql)
    
    
  end
end
