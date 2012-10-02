class Purchase < ActiveRecord::Base
  attr_accessible :total, :date
  has_many :p_details, :foreign_key => "purchase_id", :dependent => :destroy
end
