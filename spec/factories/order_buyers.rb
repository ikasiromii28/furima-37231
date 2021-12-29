FactoryBot.define do
  factory :order_buyer do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Lorem.sentence }
    addresses     { Faker::Lorem.sentence }
    building      { Faker::Lorem.sentence }
    phone_number  { '08012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
