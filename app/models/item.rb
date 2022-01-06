class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :status_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :schedule_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to :shipping
  belongs_to :status
end
