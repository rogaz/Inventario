class Sale < ActiveRecord::Base
  attr_accessible :customer_id, :date, :total
  has_many :products
end
