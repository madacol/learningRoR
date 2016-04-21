require 'test_helper'

class GGsControllerTest < ActionController::TestCase
  setup do
    @gg = ggs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ggs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gg" do
    assert_difference('Gg.count') do
      post :create, gg: { code: @gg.code, description: @gg.description }
    end

    assert_redirected_to gg_path(assigns(:gg))
  end

  test "should show gg" do
    get :show, id: @gg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gg
    assert_response :success
  end

  test "should update gg" do
    patch :update, id: @gg, gg: { code: @gg.code, description: @gg.description }
    assert_redirected_to gg_path(assigns(:gg))
  end

  test "should destroy gg" do
    assert_difference('Gg.count', -1) do
      delete :destroy, id: @gg
    end

    assert_redirected_to ggs_path
  end
end
