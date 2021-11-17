class Product < ApplicationRecord
  validates :description, :product_type, :cost, :sale_value, presence: true
  validates :description, length: { minimum: 10 }
end
