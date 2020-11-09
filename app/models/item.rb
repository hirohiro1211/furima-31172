class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_date

  validates :image, presence: true
  validates :name, presence: true
  validates :introduce, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :delivery_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :delivery_date_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
end
