class Customer < ActiveRecord::Base
  attr_accessible :last_visit_date, :name, :phone, :reference_person
end
