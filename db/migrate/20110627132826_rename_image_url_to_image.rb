class RenameImageUrlToImage < ActiveRecord::Migration
  def self.up
    rename_column :products, :image_url, :image
  end

  def self.down
    rename_column :products, :image, :image_url
  end
end
