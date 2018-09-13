class StaffsController < ApplicationController

  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      flash[:notice] = 'スタッフ登録完了'
      redirect_to new_staff_path
    else
      render 'new'
    end
  end
  
  def confirm
    @staff = Staff.new(staff_params)
  end
  
  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    #ストックiDテーブルのstaff_idを空にする。situationを在庫に戻す
    @stock = Stock.find(params[:id])
    @stock.staff_id = nil
    @stock.situation = "在庫"
    
  end




  private
  
  def staff_params
    params.require(:staff).permit(:staff_id, :staff_name, :postal_code,
                                 :street_address_1, :street_address_2,
                                 :phone_number_1, :phone_number_2,
                                 :enrolled, :scheduled_return_date, :remarks)
  end
end
