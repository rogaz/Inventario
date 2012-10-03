class Product < ActiveRecord::Base
  attr_accessible :product_type_id, :size
  belongs_to :product_type
  has_many :p_details
  has_many :details

  def full_product_name
    "#{size} #{product_type.type_of_products}"
  end
end
