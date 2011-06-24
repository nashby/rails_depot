require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', :minimum => 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "should display how many times the user has accessed the store controllers index action if this times count was greater then 5" do
    get :index
    assert_select '#counter', 0
    5.times {get :index}
    assert_select '#counter', 1
  end
end
