class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :kit_id
      t.string :name
      t.text :description
      t.decimal :price, :precision => 10, :scale => 3
      
      t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
