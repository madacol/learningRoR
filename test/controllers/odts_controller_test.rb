require 'test_helper'

class OdtsControllerTest < ActionController::TestCase
  setup do
    @odt = odts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:odts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create odt" do
    assert_difference('Odt.count') do
      post :create, odt: { code: @odt.code, description: @odt.description, monto_contrato: @odt.monto_contrato, razon_social_id: @odt.razon_social_id }
    end

    assert_redirected_to odt_path(assigns(:odt))
  end

  test "should show odt" do
    get :show, id: @odt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @odt
    assert_response :success
  end

  test "should update odt" do
    patch :update, id: @odt, odt: { code: @odt.code, description: @odt.description, monto_contrato: @odt.monto_contrato, razon_social_id: @odt.razon_social_id }
    assert_redirected_to odt_path(assigns(:odt))
  end

  test "should destroy odt" do
    assert_difference('Odt.count', -1) do
      delete :destroy, id: @odt
    end

    assert_redirected_to odts_path
  end
end
