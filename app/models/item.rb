class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :introduce, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_dates_id, presence: true
  validates :price, presence: true
end
