class Sale < ActiveRecord::Base
  attr_accessible :customer_id, :date, :total
  has_many :details, :foreign_key => "sale_id", :dependent => :destroy
  belongs_to :customer, :foreign_key => "customer_id"
end
