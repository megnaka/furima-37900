FactoryBot.define do
  factory :purchased_item_destination do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '東京都' }
    building_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
