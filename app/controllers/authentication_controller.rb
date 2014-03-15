#coding: utf-8
# AuthenticationController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.15

class AuthenticationController < ApplicationController

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
    else      
      reset_session
      flash[:msg] = "パスワードが不正です。"
      redirect_to root_path
    end
    
    redirect_to users_path
  end

  #
  # ログアウト処理
  #
  def logout
    reset_session
    flash[:msg] = "ログアウトしました。"
    redirect_to root_path
  end
end
