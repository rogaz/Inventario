class ProductType < ActiveRecord::Base
  attr_accessible :type_of_products
  validates :type_of_products, :presence => true
  has_many :products
end
