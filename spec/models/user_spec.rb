require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
end

describe "ユーザー新規登録" do
  context "新規登録できる場合" do
   it "nickname、email、password、password_confirmation、family_name、family_name_kana、first_name、first_name_kana、birth_dayが正しく登録されている場合" do
    expect(@user).to be_valid
   end

   it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
    @user.password = "a12345"
    @user.password_confirmation = "a12345"
    expect(@user).to be_valid
   end
  end


  context "新規登録が出来ない場合" do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it "passwordが数字だけでは登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
     end
     it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end
     it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
     end
     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end
     it "birth_dayが空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
     end
     it "重複したemailが存在する場合登録できないこと" do
      @user.save
      @user2 = FactoryBot.build(:user)
      @user2.email = @user.email
      @user2.valid?
      expect(@user2.errors.full_messages).to include "Email has already been taken"
     end
     it 'emailに@が含まれていない場合登録できない' do
      @user.email = "hogehuga.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it "passwordが6文字未満では登録できない" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "passwordは英字のみでは登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "全角文字を含むpasswordは登録できない" do
      @user.password = "あイ雨え尾かキ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "Aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
     end
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.family_name = "Aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
     end
     it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "ああ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
     end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.family_name_kana = "ああ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
     end
  end
 end
end