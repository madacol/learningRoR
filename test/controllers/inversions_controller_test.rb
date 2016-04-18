require 'test_helper'

class InversionsControllerTest < ActionController::TestCase
  setup do
    @inversion = inversions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inversion" do
    assert_difference('Inversion.count') do
      post :create, inversion: { code: @inversion.code, description: @inversion.description }
    end

    assert_redirected_to inversion_path(assigns(:inversion))
  end

  test "should show inversion" do
    get :show, id: @inversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inversion
    assert_response :success
  end

  test "should update inversion" do
    patch :update, id: @inversion, inversion: { code: @inversion.code, description: @inversion.description }
    assert_redirected_to inversion_path(assigns(:inversion))
  end

  test "should destroy inversion" do
    assert_difference('Inversion.count', -1) do
      delete :destroy, id: @inversion
    end

    assert_redirected_to inversions_path
  end
end
