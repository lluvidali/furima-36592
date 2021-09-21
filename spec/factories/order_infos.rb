FactoryBot.define do
  factory :order_info do
    postal_code { '123-4567' }
    address { 'あ' }
    city { 'あ' }
    tel { '1234567890' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    building { 'あ' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
