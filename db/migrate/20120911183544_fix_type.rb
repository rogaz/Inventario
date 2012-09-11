class FixType < ActiveRecord::Migration

  def change
    rename_column :product_types, :type, :type_of_products
  end

end
