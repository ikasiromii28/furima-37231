class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  #with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
    validates :user
    validates :image
  #end
end
