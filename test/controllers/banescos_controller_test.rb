require 'test_helper'

class BanescosControllerTest < ActionController::TestCase
  setup do
    @banesco = banescos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banescos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banesco" do
    assert_difference('Banesco.count') do
      post :create, banesco: {  }
    end

    assert_redirected_to banesco_path(assigns(:banesco))
  end

  test "should show banesco" do
    get :show, id: @banesco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banesco
    assert_response :success
  end

  test "should update banesco" do
    patch :update, id: @banesco, banesco: {  }
    assert_redirected_to banesco_path(assigns(:banesco))
  end

  test "should destroy banesco" do
    assert_difference('Banesco.count', -1) do
      delete :destroy, id: @banesco
    end

    assert_redirected_to banescos_path
  end
end
