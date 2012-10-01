class Detail < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :sale_id
  has_many :sales
  has_many :products
end

