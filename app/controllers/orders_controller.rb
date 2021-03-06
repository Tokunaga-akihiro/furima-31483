class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :order_item
before_action :different
before_action :sold_out
  def  index
     @order = Order.new
  end
 
  def create
    @order = Order.new(order_params)
     if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
       @order.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
    def order_params
      params.require(:order).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number,).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
    end

    def order_item
      @item = Item.find(params[:item_id])
    end

    def different
      if  @item.user_id == current_user.id
            redirect_to root_path
      end
    end

    def sold_out
      if  @item.purchase_record.present?
        redirect_to root_path
    end
  end
end