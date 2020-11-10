FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
    
    name                { Faker::Name.initials(number: 40) }
    introduce           { 'この商品は' }
    category_id         { 2 }
    delivery_burden_id  { 2 }
    delivery_date_id    { 2 }
    prefecture_id       { 4 }
    state_id            { 3 }
    price               { 10000 }

    association :user
  end
  
end