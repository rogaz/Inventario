class PDetail < ActiveRecord::Base
  attr_accessible :product_id, :purchase_id, :quantity, :unit_price
  belongs_to :purchase, :foreign_key => "purchase_id"
  belongs_to :product
end
