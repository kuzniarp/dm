class AddNewToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :new, :boolean
  end

  def self.down
    remove_columns :products, :new
  end
end
