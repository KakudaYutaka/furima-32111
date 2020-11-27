FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-1234' }
    state_id      { 23 }
    city          { Faker::Address.city }
    block_number  { Faker::Address.street_name }
    building_name { Faker::Address.secondary_address }
    phone_number  { '12345678901' }
  end
end
