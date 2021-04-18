require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが英文字のみでは登録できない" do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
      it "passwordが数字のみでは登録できない" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
      it "passwordが全角では登録できない" do
      @user.password = 'AAA11'
      @user.password_confirmation = 'AAA11'
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが英文字のみでは登録できない" do
      @user.password_confirmation = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが数字のみでは登録できない" do
      @user.password_confirmation = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが全角では登録できない" do
      @user.password_confirmation = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "emailが@を含んでいないと登録できない" do
      @user.email = 'hoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "ユーザー本名は、名字が必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名は、名前が必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "ユーザー名字のフリガナは、名字と名前が空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "ユーザー名前のフリガナは、名字と名前が空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
     it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
