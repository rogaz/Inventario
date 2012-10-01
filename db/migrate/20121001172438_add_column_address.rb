class AddColumnAddress < ActiveRecord::Migration
  def self.up
    add_column :customers,:address,:string
  end

  def down
  end
end
