class MakePhotoPolymorphic < ActiveRecord::Migration
  def self.up
    rename_column :photos, :gallery_id, :photoable_id
    add_column :photos, :photoable_type, :string
  end

  def self.down
    remove_column :photos, :photoable_type
    rename_column :photos, :photoable_id, :gallery_id
  end
end