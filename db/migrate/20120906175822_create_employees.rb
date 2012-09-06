class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.string :job_title
      t.date :hire_date
      t.date :termination_date
      t.decimal :salary
      t.string :horary

      t.timestamps
    end
  end
end
