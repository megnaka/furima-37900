require 'rails_helper'

RSpec.describe PurchasedItemDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchased_item_destination = FactoryBot.build(:purchased_item_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchased_item_destination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchased_item_destination.building_name = ''
        expect(@purchased_item_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchased_item_destination.token = nil
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchased_item_destination.postal_code = ''
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchased_item_destination.postal_code = '1234567'
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchased_item_destination.prefecture_id = 0
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchased_item_destination.city = ''
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'building_addressが空だと保存できないこと' do
        @purchased_item_destination.building_address = ''
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Building address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchased_item_destination.phone_number = ''
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字以外が含まれている場合は保存できないこと' do
        @purchased_item_destination.phone_number = '０９０-１２３４-５６７８'
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchased_item_destination.phone_number = '123456789'
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchased_item_destination.phone_number = '090123456789'
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchased_item_destination.user_id = nil
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchased_item_destination.item_id = nil
        @purchased_item_destination.valid?
        expect(@purchased_item_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
