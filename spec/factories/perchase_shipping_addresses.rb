FactoryBot.define do
  factory :perchase_shipping_address do
    telephone_number { '09012345678' }
    postal_code { '181-0013' }
    prefecture_id { 2 }
    city           {'三鷹市'}
    address        {'上連雀'}
    token          {'tok_abcdefghijk00000000000000000'}
  end
end
