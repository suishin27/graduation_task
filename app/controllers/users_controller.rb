class UsersController < ApplicationController
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
end
