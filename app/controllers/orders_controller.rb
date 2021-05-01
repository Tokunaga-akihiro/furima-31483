class OrdersController < ApplicationController
before_action :order_item, :order_user
  def  index
    # @item = Item.new
     @order = Order.new
  end

  def new
    @order = Order.new
  end
 
  def create
    @order = Order.new(order_params)
     if @order.valid?
       @order.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
    def order_params
      params.require(:order).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number,).merge(item_id: @item.id, user_id: current_user.id)
    end

    def order_item
      @item = Item.find(params[:item_id])
    end

    def order_user
      @user = current_user.id
    end
end