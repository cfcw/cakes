#coding: utf-8
# SessionController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.22
class SessionController < ApplicationController
  before_filter :check_login
  
  #
  # ログイン判定処理
  #
  private 
  def check_login
    if session[:is_login] then
      return      
    else
      redirect_to login_index_path
    end
  end
end
