require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it "が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "" do
      end
      it "" do
      end
    end

    context '商品登録がうまくいかないとき' do
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
    end
  end
end