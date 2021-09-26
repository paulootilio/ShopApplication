class StockItem < ApplicationRecord
  attr_accessor :stock_remove

  belongs_to :store
  belongs_to :product
end
