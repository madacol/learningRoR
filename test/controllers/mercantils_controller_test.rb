require 'test_helper'

class MercantilsControllerTest < ActionController::TestCase
  setup do
    @mercantil = mercantils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mercantils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mercantil" do
    assert_difference('Mercantil.count') do
      post :create, mercantil: {  }
    end

    assert_redirected_to mercantil_path(assigns(:mercantil))
  end

  test "should show mercantil" do
    get :show, id: @mercantil
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mercantil
    assert_response :success
  end

  test "should update mercantil" do
    patch :update, id: @mercantil, mercantil: {  }
    assert_redirected_to mercantil_path(assigns(:mercantil))
  end

  test "should destroy mercantil" do
    assert_difference('Mercantil.count', -1) do
      delete :destroy, id: @mercantil
    end

    assert_redirected_to mercantils_path
  end
end
