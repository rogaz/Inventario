class Product < ActiveRecord::Base
  attr_accessible :product_type_id, :size
  belongs_to :product_type
end
