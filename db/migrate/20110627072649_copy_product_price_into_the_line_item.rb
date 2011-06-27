class CopyProductPriceIntoTheLineItem < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |line_item|
      product = Product.find(line_item.product_id)
      
      line_item.price = product.price*line_item.quantity
      line_item.save
    end
  end

  def self.down
    LineItem.all.each do |line_item|
      line_item.price = nil
      line_item.save
    end    
  end
end
