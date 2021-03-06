#coding: utf-8
# AuthenticationController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.15

#ログイン認証コントローラクラス
class AuthenticationController < ApplicationController
  skip_before_filter :check_login, :only => [:auth]

  #
  # ログイン認証処理
  # ==== Parameters
  # * +params[:email]+ - ログインID
  # * +params[:passwd]+ - パスワード
  # ==== Return
  # * +redirect_to+ - リダイレクト
  # ==== Examples
  # 
  def auth
    user = User.authenticate(params[:email], params[:passwd])
          
    if user then
      #ログイン情報セッション登録
      session[:is_login] = true
      session[:user_id] = user.id
      session[:login_name] = user.login_name

      #ログ取得
      history = History.new
      history.user_id = session[:user_id]
      history.user_name = session[:login_name]
      history.action = "ログイン"
      history.ip_address = request.remote_ip
      history.save
      
      redirect_to mypage_main_path
    else      
      reset_session
      flash[:msg] = "ログインが不正です。"
      redirect_to login_index_path
    end
    
  end

  #
  # ログアウト処理
  # ==== Parameters
  #
  # ==== Return
  # * +redirect_to+ - リダイレクト
  # ==== Examples
  # 
  def logout
    #ログ取得
    history = History.new
    history.user_id = session[:user_id]
    history.user_name = session[:login_name]
    history.action = "ログアウト"
    history.ip_address = request.remote_ip
    history.save
    
    reset_session
    flash[:msg] = "ログアウトしました。"
    redirect_to login_index_path
  end
end
