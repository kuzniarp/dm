class CreateProducers < ActiveRecord::Migration
  def self.up
    create_table :producers do |t|
      t.string :name
      t.string :permalink
      t.integer :subpage_id
      t.string :image_file_name
      t.string :image_content_type
    end
  end

  def self.down
    drop_table :producers
  end
end
