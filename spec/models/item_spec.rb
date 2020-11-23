require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it "image,product,description,category_id,status_id,ship_method_id,shipment_source_id,days_to_ship_id,price,全てが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '100000'
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空だと登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'status_idが空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it 'ship_method_idが空だと登録できない' do
        @item.ship_method_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method Select")
      end
      it 'shipment_source_idが空だと登録できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source Select")
      end
      it 'days_to_ship_idが空だと登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship Select")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが10000000以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが半角数字以外だと登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end