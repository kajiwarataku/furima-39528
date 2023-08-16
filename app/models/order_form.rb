class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :municipality, :house_number, :building_name, :telephone_number, :token

    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality, presence: true
    validates :house_number, presence: true
    validates :telephone_number, presence: true, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token, presence: true


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, post_code: post_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end