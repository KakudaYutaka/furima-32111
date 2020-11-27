require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe Order do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
  
    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it 'image,product,description,category_id,status_id,ship_method_id,shipment_source_id,days_to_ship_id,price,全てが存在すれば登録できる' do
          expect(@order_address).to be_valid
        end
      end
    end
  end
end
