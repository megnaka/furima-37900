class PurchasedItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building_address, :building_name, :phone_number, :purchased_item_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :building_address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :purchased_item_id
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :user
  belongs_to :item
  has_one :destinations

  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_address: building_address, building_name: building_name, phone_number: phone_number, purchased_item_id: purchased_item_id)
  end
end
