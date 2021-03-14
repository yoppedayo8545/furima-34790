require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
    @user = FactoryBot.create(:user)
    @purchase_address.user_id = @user.id
    @item = FactoryBot.create(:item)
    @purchase_address.item_id = @item.id
    sleep 0.1
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it '必要項目を全て入力すると登録できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
       expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end

      it 'postal_codeが空だと購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeに"-"が無いと購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end

      it 'prefectures_idが空だと購入できない' do
        @purchase_address.prefectures_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefectures can't be blank"
      end

      it 'municipalityが空だと購入できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressが空だと購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numが空だと購入できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone num can't be blank"
      end

      it 'phone_numが12桁以上だと購入できない' do
        @purchase_address.phone_num = '123456789999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone num is invalid. Numbers within 11 digits"
      end

      it 'phone_numが英字だと購入できない' do
        @purchase_address.phone_num = 'yoshida'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone num is invalid. Numbers within 11 digits'
      end

      it 'phone_numが漢字だと購入できない' do
        @purchase_address.phone_num = '吉田'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone num is invalid. Numbers within 11 digits'
      end

      it 'phone_numがひらがなだと購入できない' do
        @purchase_address.phone_num = 'よしだ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone num is invalid. Numbers within 11 digits'
      end

      it 'phone_numがカタカナだと購入できない' do
        @purchase_address.phone_num = 'ヨシダ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone num is invalid. Numbers within 11 digits'
      end

      it 'userが空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが空だと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
