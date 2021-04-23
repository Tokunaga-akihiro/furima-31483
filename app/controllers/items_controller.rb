class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :different, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def update
    # if  @item = Item.find(params[:id])
      if  @item.update(item_params)
    redirect_to item_path
    else
    render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:price, :image, :product_name, :description, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :ship_date_id).merge(user_id: current_user.id)
  end

  def different
    unless  @item.user_id == current_user.id
          redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end