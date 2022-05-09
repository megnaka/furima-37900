class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_payer
  belongs_to :prefecture
  belongs_to :sending_days

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid.Input half-width characters' }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :category, numericality: { other_than: 0 , message: "can't be blank"}
    validates :condition, numericality: { other_than: 0 , message: "can't be blank"}
    validates :delivery_payer, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture, numericality: { other_than: 0 , message: "can't be blank"}
    validates :sending_days, numericality: { other_than: 0 , message: "can't be blank"}
  end
end
