require 'test_helper'

class AwsUsersControllerTest < ActionController::TestCase
  setup do
    @aws_user = aws_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_user" do
    assert_difference('AwsUser.count') do
      post :create, aws_user: { email: @aws_user.email, first_name: @aws_user.first_name, last_name: @aws_user.last_name }
    end

    assert_redirected_to aws_user_path(assigns(:aws_user))
  end

  test "should show aws_user" do
    get :show, id: @aws_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_user
    assert_response :success
  end

  test "should update aws_user" do
    patch :update, id: @aws_user, aws_user: { email: @aws_user.email, first_name: @aws_user.first_name, last_name: @aws_user.last_name }
    assert_redirected_to aws_user_path(assigns(:aws_user))
  end

  test "should destroy aws_user" do
    assert_difference('AwsUser.count', -1) do
      delete :destroy, id: @aws_user
    end

    assert_redirected_to aws_users_path
  end
end
