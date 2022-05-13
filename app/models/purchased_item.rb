class PurchasedItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchased_item
end
