require 'test_helper'

class ProvincialsControllerTest < ActionController::TestCase
  setup do
    @provincial = provincials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provincials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provincial" do
    assert_difference('Provincial.count') do
      post :create, provincial: {  }
    end

    assert_redirected_to provincial_path(assigns(:provincial))
  end

  test "should show provincial" do
    get :show, id: @provincial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provincial
    assert_response :success
  end

  test "should update provincial" do
    patch :update, id: @provincial, provincial: {  }
    assert_redirected_to provincial_path(assigns(:provincial))
  end

  test "should destroy provincial" do
    assert_difference('Provincial.count', -1) do
      delete :destroy, id: @provincial
    end

    assert_redirected_to provincials_path
  end
end
