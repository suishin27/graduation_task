class StocksController < ApplicationController
  before_action :current_user_loggin?, only: [:new, :edit, :aggregate, :index, :return_list, :return_procedure, :stock_list]

#検索画面
  def index
    @search = Stock.ransack(params[:q]) 
    @stock = @search.result
    if @stock.nil?
      @stock = Stock.all
    else
      @stock　= Stock.where(params[:serial_number])
    end
  end

#在庫貸出し関連
  def stock_list
    @stock = Stock.all
  end
  
  
  def new
    @stock = Stock.new
  end
#在庫新規登録--------------------------------------
  def create
    @stock = Stock.new(stock_params)
    if @stock.save(:validate => false)
      flash[:notice] = '在庫登録完了'
      redirect_to new_stock_path
    else
      render 'new'
    end
  end
  
  def confirm
    @stock = Stock.new(stock_params)
  end
  
  def edit
    @stock = Stock.find(params[:id])
  end
#貸出し、返却登録----------------------------------------------
  def update
    @stock = Stock.find(params[:id])
    if params[:commit] == "返却登録"
      @stock.update(situation: "在庫")
      @stock.update(staff_id: "0")
      redirect_to return_list_path, notice: "返却登録しました"
    elsif params[:commit] == "貸出登録"
      @stock.update(stock_params)
      @stock.situation = "レンタル中"
      redirect_to stock_list_path, notice: "登録しました"
    else
      render 'edit', notice: "登録できませんでした"
    end
  end  
#返却処理関連---------------------------------------------------
  def return_list #旧staff#index
    @staff = Staff.all
    @stock = Stock.all
  end
  
  def return_procedure #旧staff#edit
    @stock = Stock.find(params[:id])
  end
  
  def return_registration
    @stock = Stock.find(params[:id])
    @stock.staff_id = nil
    @stock.situation = "在庫"
    render '/return_list'
  end
#集計機能-----------------------------------------------------
  def aggregate
    @stock = Stock.all
  end
#検索機能
  def search_screen
  @search = Stock.search(params[:q]) 
  @stock = @search.result
     
  respond_to do |format|
    format.html
    format.json { render json: @stock }
  end
  end

  
#private------------------------------------------------------------------
  private
  
  def stock_params
    params.require(:stock).permit(:product_type, :manufacturer, :serial_number,
                                 :asset_management_number, :remarks, :staff_id,
                                 :situation)
  end
  
  def current_user_loggin?
    if logged_in?
      #
    else
      redirect_to new_session_path, notice:"ログインしてね"
    end
  end
end
