class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id,numericality: { other_than: 1 , message: "can't be blank"} 
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
    validates :user
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

end
