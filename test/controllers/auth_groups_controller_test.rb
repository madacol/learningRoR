require 'test_helper'

class AuthGroupsControllerTest < ActionController::TestCase
  setup do
    @auth_group = auth_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auth_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auth_group" do
    assert_difference('AuthGroup.count') do
      post :create, auth_group: { name: @auth_group.name }
    end

    assert_redirected_to auth_group_path(assigns(:auth_group))
  end

  test "should show auth_group" do
    get :show, id: @auth_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auth_group
    assert_response :success
  end

  test "should update auth_group" do
    patch :update, id: @auth_group, auth_group: { name: @auth_group.name }
    assert_redirected_to auth_group_path(assigns(:auth_group))
  end

  test "should destroy auth_group" do
    assert_difference('AuthGroup.count', -1) do
      delete :destroy, id: @auth_group
    end

    assert_redirected_to auth_groups_path
  end
end
