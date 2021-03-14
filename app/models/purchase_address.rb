class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_num, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality, :address, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_num, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Numbers within 11 digits' }
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                   building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end
