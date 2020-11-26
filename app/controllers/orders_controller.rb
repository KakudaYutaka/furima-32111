class OrdersController < ApplicationController

  def index
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
       @order_address.save
       redirect_to root_path
     else
       render action: :index
     end
  end





  private

  #クレカの情報も追加すること
  def order_params
    params.require(:order_address).permit(:postal_code, :state_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end