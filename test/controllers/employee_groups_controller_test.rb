require 'test_helper'

class EmployeeGroupsControllerTest < ActionController::TestCase
  setup do
    @employee_group = employee_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_group" do
    assert_difference('EmployeeGroup.count') do
      post :create, employee_group: { auth_group_id: @employee_group.auth_group_id, employee_id: @employee_group.employee_id }
    end

    assert_redirected_to employee_group_path(assigns(:employee_group))
  end

  test "should show employee_group" do
    get :show, id: @employee_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_group
    assert_response :success
  end

  test "should update employee_group" do
    patch :update, id: @employee_group, employee_group: { auth_group_id: @employee_group.auth_group_id, employee_id: @employee_group.employee_id }
    assert_redirected_to employee_group_path(assigns(:employee_group))
  end

  test "should destroy employee_group" do
    assert_difference('EmployeeGroup.count', -1) do
      delete :destroy, id: @employee_group
    end

    assert_redirected_to employee_groups_path
  end
end
