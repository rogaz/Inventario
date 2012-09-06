class Expense < ActiveRecord::Base
  attr_accessible :date, :description, :total
end
