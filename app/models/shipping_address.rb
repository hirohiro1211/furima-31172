class ShippingAddress < ApplicationRecord
  belongs_to :perchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
