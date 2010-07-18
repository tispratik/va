require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should create user" do
    User.any_instance.expects(:save).returns(true)
    post :create, :user => { }
    assert_response :redirect
  end

  test "should handle failure to create user" do
    User.any_instance.expects(:save).returns(false)
    post :create, :user => { }
    assert_template "new"
  end

  test "should destroy user" do
    User.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => users(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy user" do
    User.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => users(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for user" do
    get :edit, :id => users(:one).to_param
    assert_response :success
  end

  test "should get index for users" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new for user" do
    get :new
    assert_response :success
  end

  test "should get show for user" do
    get :show, :id => users(:one).to_param
    assert_response :success
  end

  test "should update user" do
    User.any_instance.expects(:save).returns(true)
    put :update, :id => users(:one).to_param, :user => { }
    assert_response :redirect
  end

  test "should handle failure to update user" do
    User.any_instance.expects(:save).returns(false)
    put :update, :id => users(:one).to_param, :user => { }
    assert_template "edit"
  end

end