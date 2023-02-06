require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include "email can't be blank"
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include "password can't be blank"
    end
    it "passwordが数字だけでは登録できない" do
      user = FactoryBot.build(:user)
      user.password = '123456'
      user.valid?
      expect(user.errors.full_messages).to include "password can't be blank"
    end
    it "password_confirmationが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include "password_confirmation can't be blank"
    end
    it "family_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "family_name can't be blank"
    end
    it "first_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "first_name can't be blank"
    end
    it "family_name_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "family_name_kana can't be blank"
    end
    it "first_name_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "first_name_kana can't be blank"
    end
    it "birth_dayが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birth_day = ''
      user.valid?
      expect(user.errors.full_messages).to include "birth_day can't be blank"
    end
  end
end


#user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "熊本", first_name: "太郎", family_name_kana: "くまもと", first_name_kana: "タロウ", birth_day: "2000-01-01")