class Product < ApplicationRecord
  has_many :stock_item
  # belongs_to :store
end
