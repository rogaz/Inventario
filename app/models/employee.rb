class Employee < ActiveRecord::Base
  attr_accessible :name, :address, :hire_date, :horary, :job_title, :salary, :termination_date

  validate :name, :presence => true
  validate :address, :address => true
  validate :hire_date, :presence => true
  validate :salary, :presence => true


end
