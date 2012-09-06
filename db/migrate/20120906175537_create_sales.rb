class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.decimal :total
      t.integer :customer_id

      t.timestamps
    end
  end
end
