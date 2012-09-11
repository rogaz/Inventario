class ProductType < ActiveRecord::Base
  attr_accessible :type_of_products
  validates_presence_of :type_of_products
 has_many :products
end
