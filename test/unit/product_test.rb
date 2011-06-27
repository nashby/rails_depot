require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def new_product(image_url)
    Product.new(:title => "My Book Title",
                :description => "yyy",
                :price => 1,
                :image => image_url)
  end
  
  test "product is not valid without a unique title - i18n" do
    product = Product.new(:title => products(:ruby).title,
                          :description => "yyy",
                          :price => 1,
                          :image => "fred.gif")

    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), product.errors[:title].join('; ')
  end  
  
  test "product is not valid with a title length < 10" do
    product = Product.new(:title => "test",
                          :description => "yyy",
                          :price => 1,
                          :image => "fred.gif")
    assert !product.save
  end
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(:title => "My Book Title",
                          :description => "yyy",
                          :image => "zzz.jpg")
    product.price = -1
    
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')
    
    product.price = 0
    
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')
    
    product.price = 1
    
    assert product.valid?
  end

end
