class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.string :name
      t.string :url, :limit => 500
      t.string :permalink
      t.string :image_file_name
      t.string :image_content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :partners
  end
end
