FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.sentence }
    description        { Faker::Lorem.sentence }
    category_id        { Faker::Number.between(from: 1, to: 10) }
    condition_id       { Faker::Number.between(from: 1, to: 5) }
    delivery_payer_id  { Faker::Number.between(from: 1, to: 2) }
    prefecture_id      { Faker::Number.between(from: 1, to: 47) }
    sending_days_id    { Faker::Number.between(from: 1, to: 3) }
    price              { Faker::Number.between(from: 300, to: 9999999) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
