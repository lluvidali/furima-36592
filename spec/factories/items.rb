FactoryBot.define do
  factory :item do
    
    association :user

    product { "aaaaaa" }
    category { Category.all.sample }
    price {Faker::Number.within(range: 300..9999999)}
    delivery_fee { DeliveryFee.all.sample }
    content { "ssssss" }
    status { Status.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_day { ShippingDay.all.sample }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
