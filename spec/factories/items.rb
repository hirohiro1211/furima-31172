FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 40) }
    introduce           { 'この商品は' }
    category_id         { 2 }
    delivery_burden_id  { 2 }
    delivery_date_id    { 2 }
    prefecture_id       { 4 }
    state_id            { 3 }
    price            { 10000 }
  end
end
