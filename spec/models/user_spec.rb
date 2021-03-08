require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての入力が指定通りにされていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nick_nameが空だと登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end

    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが同一の場合登録できない' do
      @user.save
      user = FactoryBot.build(:user)
      user.email = @user.email
      user.valid?
      expect(user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'メールアドレスに＠がなければ登録できない' do
      @user.email = 'yoshidamail'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが6文字未満だと登録できない' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードが半角数字のみの場合は登録できない' do
      @user.password = '111111111'
      @user.password_confirmation = '111111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数字で設定してください'
    end
    it 'パスワードが半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaaaaaaa'
      @user.password_confirmation = 'aaaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数字で設定してください'
    end
    it 'パスワードが全角の場合は登録できない' do
      @user.password = 'ａａａａａ１１１１'
      @user.password_confirmation = 'ａａａａａ１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数字で設定してください'
    end
    it 'password_confirmationが空だと登録できない' do
      @user.password = 'aaaaaaaaaaaaaaa11'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password = 'aaaaaaaaaaaaaaa11'
      @user.password_confirmation = 'aaaaaaaaaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.last_name = 'yoshida'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name は全角の漢字で設定してください'
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.first_name = 'youhei'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name は全角の漢字で設定してください'
    end
    it 'last_kanaが空だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end
    it 'last_kanaが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.last_kana = 'yoshida'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last kana は全角のカタカナで設定してください'
    end
    it 'first_kanaが空だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end
    it 'first_kanaが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.first_kana = 'youhei'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First kana は全角のカタカナで設定してください'
    end
    it 'dateが空だと登録できない' do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date can't be blank"
    end
  end
end
