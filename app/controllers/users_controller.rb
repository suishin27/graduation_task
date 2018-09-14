class UsersController < ApplicationController
  before_action :current_user_loggin?, only: [:new, :index]
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save                       #バリテーションチェック
      redirect_to new_session_path
    else
      render 'new'
    end
  end
    
  private
  
  def user_params
    params.require(:user).permit(:user_name, :login_id, :password,
                                 :password_confirmation)
  end
  def current_user_loggin?
    if logged_in?
      #
    else
      redirect_to new_session_path, notice:"ログインしてね"
    end
  end  
end
