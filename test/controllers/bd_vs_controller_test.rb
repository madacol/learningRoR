require 'test_helper'

class BdVsControllerTest < ActionController::TestCase
  setup do
    @bdv = bdvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bdvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bdv" do
    assert_difference('Bdv.count') do
      post :create, bdv: {  }
    end

    assert_redirected_to bdv_path(assigns(:bdv))
  end

  test "should show bdv" do
    get :show, id: @bdv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bdv
    assert_response :success
  end

  test "should update bdv" do
    patch :update, id: @bdv, bdv: {  }
    assert_redirected_to bdv_path(assigns(:bdv))
  end

  test "should destroy bdv" do
    assert_difference('Bdv.count', -1) do
      delete :destroy, id: @bdv
    end

    assert_redirected_to bdvs_path
  end
end
