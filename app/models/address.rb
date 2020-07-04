class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_name, :address_furi, :post_num, :prefecture, :city, :address ,presence: true
end