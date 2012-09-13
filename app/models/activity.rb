class Activity < ActiveRecord::Base
  attr_accessible :date, :description, :title
  validates_presence_of :description, :title, :date
end
