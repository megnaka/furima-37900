FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'すずき' }
    first_name            { 'たろう' }
    last_name_kana        { 'ズズキ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
