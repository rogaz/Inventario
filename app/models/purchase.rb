class Purchase < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :unit_price
end
