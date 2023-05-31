require 'test_helper'

class BodsControllerTest < ActionController::TestCase
  setup do
    @bod = bods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bod" do
    assert_difference('Bod.count') do
      post :create, bod: {  }
    end

    assert_redirected_to bod_path(assigns(:bod))
  end

  test "should show bod" do
    get :show, id: @bod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bod
    assert_response :success
  end

  test "should update bod" do
    patch :update, id: @bod, bod: {  }
    assert_redirected_to bod_path(assigns(:bod))
  end

  test "should destroy bod" do
    assert_difference('Bod.count', -1) do
      delete :destroy, id: @bod
    end

    assert_redirected_to bods_path
  end
end
