require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context "商品を購入できる場合" do
      it "配送先の郵便番号、都道府県、市町区村、番地、電話番号についての情報があれば購入できる" do
        expect(@order).to be_valid
      end

       it "建物名が記入されていなくても購入できる" do
         @order.building_name = ""
         expect(@order).to be_valid
       end
    end


    context '商品の購入がうまく行かないとき' do
      it "郵便番号が入力されていないと購入できない" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it "郵便番号にハイフンが入力されていないと購入できない" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it "都道府県が入力されていないと購入できない" do
        @order.shipping_area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include()
      end

      it "市町区村が入力されていないと購入できない" do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "番地が入力されていないと購入できない" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が入力されていないと購入できない" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が11桁以外だと購入できない" do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号に数字以外が含まれていると購入できない" do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it "トークンが空だと購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空だと購入できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと購入できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

