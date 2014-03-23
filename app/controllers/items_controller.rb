#coding: utf-8
# ItemsController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.22

# 商品コントローラクラス
class ItemsController < SessionController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  #
  # 商品詳細表示処理
  # ==== Parameters
  # * +params[:id]+ - 商品ID
  # * +params[:tab_mode]+ - 画面タブモード('basic'/'reputation'/'map')
  # ==== Return
  # * +render+ - 画面レンダリング
  # ==== Examples
  # 
  def show
    @tab_mode = params[:tab_mode]
    #商品詳細取得
    @item = Item.find(params[:id])
    @reputation = Reputation.new
    @reputation.shop_id = @item.shop_id
    @reputation.item_id = @item.id

    #ログ取得
    history = History.new
    history.user_id = session[:user_id]
    history.user_name = session[:login_name]
    history.action = "商品詳細:" + @item.id.to_s
    history.ip_address = request.remote_ip
    history.save
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  #
  # 評価登録処理
  # ==== Parameters
  # * +params[:reputation]+ - 口コミ評価
  # * +params[:rank]+ - ランク
  # * +params[:tab_mode]+ - 画面タブモード('basic'/'reputation'/'map')
  # ==== Return
  # * +redirect_to+ - リダイレクト
  # ==== Examples
  # 
  def create
    tab_mode = params[:tab_mode]    
    @reputation = Reputation.new(params[:reputation])
    @reputation.user_id = session[:user_id]
    @reputation.rank = params[:rank]
    
    respond_to do |format|
      if @reputation.save
        format.html { redirect_to :controller => "items", :action => "show", :id => @reputation.item_id, :tab_mode => tab_mode, notice: '口コミを登録しました。' }
        format.json { render json: @reputation, status: :created, location: @reputation }
      else
        format.html { render action: "new" }
        format.json { render json: @reputation.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end



  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
