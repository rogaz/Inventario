class Employee < ActiveRecord::Base
  attr_accessible :name, :address, :hire_date, :horary, :job_title, :salary, :termination_date
  validates_presence_of :name ,:address,:salary,:job_title,:horary
  validates :hire_date, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}

end
