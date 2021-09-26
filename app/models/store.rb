class Store < ApplicationRecord
  has_many :stock_items, class_name: "StockItem", dependent: :delete_all
  has_many :products, class_name: "Product", through: :stock_items
end
