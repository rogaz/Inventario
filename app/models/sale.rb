class Sale < ActiveRecord::Base
  attr_accessible :customer_id, :date, :total
end
