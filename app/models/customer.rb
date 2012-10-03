class Customer < ActiveRecord::Base
  attr_accessible :last_visit_date, :name, :phone, :reference_person,:address
  has_many :sales, :foreign_key => "customer_id"
  validates_presence_of :last_visit_date , :name, :phone, :reference_person, :address

end
