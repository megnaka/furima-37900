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
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }
  end

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :delivery_payer_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :sending_days_id, numericality: { other_than: 0 , message: "can't be blank"}
end
