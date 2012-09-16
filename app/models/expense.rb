class Expense < ActiveRecord::Base
  attr_accessible :date, :description, :total

  validates :date, :presence => true
  validates :description, :presence => true
  validates :total, :presence => true
  validates :date, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
end
