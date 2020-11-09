FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 40) }
    introduce        { 'この商品は' }
    category
    delivery_burden
    delivery_date
    prefecture
    state
    price { 10_000 }
  end
end
