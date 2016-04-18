require 'test_helper'

class DeduccionesOdtsControllerTest < ActionController::TestCase
  setup do
    @deducciones_odt = deducciones_odts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deducciones_odts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deducciones_odt" do
    assert_difference('DeduccionesOdt.count') do
      post :create, deducciones_odt: { name: @deducciones_odt.name, odt_id_id: @deducciones_odt.odt_id_id, p_gasto: @deducciones_odt.p_gasto }
    end

    assert_redirected_to deducciones_odt_path(assigns(:deducciones_odt))
  end

  test "should show deducciones_odt" do
    get :show, id: @deducciones_odt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deducciones_odt
    assert_response :success
  end

  test "should update deducciones_odt" do
    patch :update, id: @deducciones_odt, deducciones_odt: { name: @deducciones_odt.name, odt_id_id: @deducciones_odt.odt_id_id, p_gasto: @deducciones_odt.p_gasto }
    assert_redirected_to deducciones_odt_path(assigns(:deducciones_odt))
  end

  test "should destroy deducciones_odt" do
    assert_difference('DeduccionesOdt.count', -1) do
      delete :destroy, id: @deducciones_odt
    end

    assert_redirected_to deducciones_odts_path
  end
end
