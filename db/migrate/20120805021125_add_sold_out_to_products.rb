class AddSoldOutToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :sold_out, :boolean
  end

  def self.down
    remove_column :products, :sold_out
  end
end
