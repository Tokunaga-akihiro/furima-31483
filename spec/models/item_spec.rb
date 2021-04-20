require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品を出品できる場合" do
      it "商品画像、商品名、商品の説明、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格についての情報があれば出品できる" do
        expect(@item).to be_valid
      end
    end


    context "商品の出品がうまくいかないとき" do
      it "商品画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
        it "カテゴリーの情報が空だと出品できない" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
      end
      it "商品の状態が空だと出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number", "Status can't be blank")
      end
      it "配送料の負担についての情報が空だと出品できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "配送元の地域についての情報が空だと出品できない" do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number", "Shipping area can't be blank")
      end
      it "発送までの日数についての情報が空だと出品できない" do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end
      it "価格についての情報が必須であること" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price can't be blank", "Price is not a number")
      end
    end
  end
end