class PerchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :telephone_number, :postal_code, :prefecture_id, :city, :address, :building_name, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :telephone_number, length: {is:11}
    validates :postal_code, length: {is:8}, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :token
  end

  def save
    perchase = Perchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, telephone_number: telephone_number, prefecture_id: prefecture_id, city: city, building_name: building_name, address: address, perchase_id: perchase.id)
  end

end