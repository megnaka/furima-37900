class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_payer, :prefecture, :sending_days

  with_options presence: true do
    validates :item_name, :description
    validates :price,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    with_options numericality: { other_than: 0 , message: "can't be blank"} do
      validates :category, :condition, :delivery_payer, :prefecture, :sending_days
    end
  end
end
