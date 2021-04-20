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
      it "商品名がないと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
        it "カテゴリーの情報が未選択のidだと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が未選択のidだと出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報が未選択のidだと出品できない" do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "配送元の地域についての情報が未選択のidだと出品できない" do
        @item.shipping_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
      end
      it "発送までの日数についての情報が未選択のidだと出品できない" do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date must be other than 1")
      end
      it "価格についての情報が必須であること" do
        @item.price = ''
        @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price can't be blank", "Price is not a number")
      end
      it "価格が全角だと出品できない" do
        @item.price = '１１１'
        @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が下限未満だと出品できない" do
        @item.price = '1'
        @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が上限を超えると出品できない" do
        @item.price = '10000000'
        @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格が数字以外も混じっていると出品できない" do
        @item.price = '300a'
        @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end