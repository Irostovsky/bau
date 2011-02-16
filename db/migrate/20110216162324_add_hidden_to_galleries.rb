class AddHiddenToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :visible, :boolean, :default => true
  end

  def self.down
    remove_column :galleries, :visible
  end
end
