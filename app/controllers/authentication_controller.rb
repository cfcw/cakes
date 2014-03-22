#coding: utf-8
# AuthenticationController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.15
class AuthenticationController < ApplicationController
  skip_before_filter :check_login, :only => [:auth]

  #
  # ログイン認証処理
  #
  def auth
    user = User.authenticate(params[:email], params[:passwd])
    
    if user then
      #ログイン情報セッション登録
      session[:is_login] = true
      session[:user_id] = user.id
      session[:login_name] = user.login_name
      redirect_to mypage_main_path
    else      
      reset_session
      flash[:msg] = "ログインが不正です。"
      redirect_to login_index_path
    end
    
  end

  #
  # ログアウト処理
  #
  def logout
    reset_session
    flash[:msg] = "ログアウトしました。"
    redirect_to login_index_path
  end
end
