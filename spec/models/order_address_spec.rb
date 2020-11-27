require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe Order do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it 'token,postal_code,state_id,city,block_number,phone_numberが存在すれば登録できる' do
          expect(@order_address).to be_valid
        end
      end

      context '商品購入ががうまくいかないとき' do
        it 'tokenが空だと登録できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空だと登録できない' do
          @order_address.postal_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeに-が含まれていない場合は登録できない' do
          @order_address.postal_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
        end
        it 'postal_codeが「3桁-4桁」形ではない場合は登録できない' do
          @order_address.postal_code = '12-567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
        end
        it 'postal_codeが半角数字ではない場合は登録できない' do
          @order_address.postal_code = '１２３-４５６７'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
        end
        it 'state_idが1（--）の場合は登録できない' do
          @order_address.state_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('State Select')
        end
        it 'cityが空だと登録できない' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'block_numberが空だと登録できない' do
          @order_address.block_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Block number can't be blank")
        end
        it 'phone_numberが空だと登録できない' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁以内でない場合は登録できない' do
          @order_address.phone_number = '123456789012'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number Input only number')
        end
        it 'phone_numberが半角数字でない場合は登録できない' do
          @order_address.phone_number = '１２３４５６７８９０１'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number Input only number')
        end
      end
    end
  end
end
