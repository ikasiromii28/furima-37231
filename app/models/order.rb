class Order < ApplicationRecord
  # attr_accessor :token
  # validates :price, presence: true
  # validates :token, presence: true
 belongs_to :user
 belongs_to :item
 has_one :buyer
end
