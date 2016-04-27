require 'test_helper'

class RetencionesControllerTest < ActionController::TestCase
  setup do
    @retencione = retenciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retenciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retencione" do
    assert_difference('Retencione.count') do
      post :create, retencione: { code_factura: @retencione.code_factura, description: @retencione.description, monto: @retencione.monto, razon_social_id: @retencione.razon_social_id, status: @retencione.status, type: @retencione.type }
    end

    assert_redirected_to retencione_path(assigns(:retencione))
  end

  test "should show retencione" do
    get :show, id: @retencione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retencione
    assert_response :success
  end

  test "should update retencione" do
    patch :update, id: @retencione, retencione: { code_factura: @retencione.code_factura, description: @retencione.description, monto: @retencione.monto, razon_social_id: @retencione.razon_social_id, status: @retencione.status, type: @retencione.type }
    assert_redirected_to retencione_path(assigns(:retencione))
  end

  test "should destroy retencione" do
    assert_difference('Retencione.count', -1) do
      delete :destroy, id: @retencione
    end

    assert_redirected_to retenciones_path
  end
end
