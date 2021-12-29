class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'の3桁目と4桁目の間にハイフンを入力してください (例： 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'は10桁以上、11桁以下で入力してください' }
    validates :user_id
    validates :item_id
  end
  validates :phone_number, numericality: { message: 'は半角数値で入力してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                 building: building, phone_number: phone_number, order_id: order.id)
  end
end
