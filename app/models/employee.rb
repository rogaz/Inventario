class Employee < ActiveRecord::Base
  attr_accessible :name, :address, :hire_date, :horary, :job_title, :salary, :termination_date
end
