class PDetail < ActiveRecord::Base
  attr_accessible :product_id, :purchase_id, :quantity, :unit_price
end
