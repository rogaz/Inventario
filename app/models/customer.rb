class Customer < ActiveRecord::Base
  attr_accessible :last_visit_date, :name, :phone, :reference_person,:address
  validates_presence_of :last_visit_date , :name, :phone, :reference_person, :address
end
