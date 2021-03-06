require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = Factory.build(:product)
    @update = {
      :title => 'Lorem Ipsum',
      :description => 'Wibbles are fun!',
      :image => 'lorem.jpg',
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

  context "Product" do
    setup do
      @product.save
    end 

    should "should show product" do
      get :show, :id => @product.to_param
      assert_response :success
    end

    should "should get edit" do
      get :edit, :id => @product.to_param
      assert_response :success
    end

    should "should update product" do
      put :update, :id => @product.to_param, :product => @update
      assert_redirected_to product_path(assigns(:product))
    end

    should "should destroy product" do
      assert_difference('Product.count', -1) do
        delete :destroy, :id => @product.to_param
      end

      assert_redirected_to products_path
    end
  end
end
