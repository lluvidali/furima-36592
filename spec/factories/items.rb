FactoryBot.define do
  factory :item do
    association :user

    product { 'aaaaaa' }
    category_id { Faker::Number.between(from: 2, to: 11) }
    price { Faker::Number.within(range: 300..9_999_999) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    content { 'ssssss' }
    status_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
