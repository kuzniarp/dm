class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.integer :producer_id
      t.string :image_file_name
      t.string :image_content_type
    end
  end

  def self.down
    drop_table :products
  end
end
