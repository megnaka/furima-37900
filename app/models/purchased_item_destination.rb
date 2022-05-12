class PurchasedItemDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city
    validates :building_address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_address: building_address, building_name: building_name, phone_number: phone_number, purchased_item_id: purchased_item_id)
  end
end