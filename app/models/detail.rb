class Detail < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :sale_id, :unit_price
  belongs_to :sale, :foreign_key => "sale_id"
  belongs_to :product
end

