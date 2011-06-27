require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = Factory.build(:product)
    @update = {
      :title => 'Lorem Ipsum',
      :description => 'Wibbles are fun!',
      :image_url => 'lorem.jpg',
      :price => 19.95   
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', :minimum => 4
    assert_select '#main #product_list .list_description', 3
    assert_select '#main #product_list .list_description dt', 'Programming Ruby 1.9'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    @product.save
    get :show, :id => @product.to_param
    assert_response :success
  end

  test "should get edit" do
    @product.save
    get :edit, :id => @product.to_param
    assert_response :success
  end

  test "should update product" do
    @product.save
    put :update, :id => @product.to_param, :product => @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    @product.save
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product.to_param
    end

    assert_redirected_to products_path
  end
end
