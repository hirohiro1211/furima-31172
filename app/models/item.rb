class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options presence: true do
  validates :image
  validates :name
  validates :introduce
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id
  validates :delivery_burden_id
  validates :delivery_date_id
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
end
