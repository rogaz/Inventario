class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.date :date
      t.decimal :total

      t.timestamps
    end
  end
end
