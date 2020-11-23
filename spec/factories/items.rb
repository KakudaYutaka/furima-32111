FactoryBot.define do
  factory :item do
    product            { Faker::Lorem.word }
    description        { Faker::Lorem.sentence }
    category_id        { 3 }
    status_id          { 2 }
    ship_method_id     { 2 }
    shipment_source_id { 23 }
    days_to_ship_id    { 3 }
    price              { Faker::Number.number(digits: 5) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
