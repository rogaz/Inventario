class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :reference_person
      t.date :last_visit_date

      t.timestamps
    end
  end
end
