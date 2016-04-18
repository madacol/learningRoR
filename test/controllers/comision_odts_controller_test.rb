require 'test_helper'

class ComisionOdtsControllerTest < ActionController::TestCase
  setup do
    @comision_odt = comision_odts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comision_odts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comision_odt" do
    assert_difference('ComisionOdt.count') do
      post :create, comision_odt: { employee_id_id: @comision_odt.employee_id_id, odt_id_id: @comision_odt.odt_id_id, p_comision: @comision_odt.p_comision }
    end

    assert_redirected_to comision_odt_path(assigns(:comision_odt))
  end

  test "should show comision_odt" do
    get :show, id: @comision_odt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comision_odt
    assert_response :success
  end

  test "should update comision_odt" do
    patch :update, id: @comision_odt, comision_odt: { employee_id_id: @comision_odt.employee_id_id, odt_id_id: @comision_odt.odt_id_id, p_comision: @comision_odt.p_comision }
    assert_redirected_to comision_odt_path(assigns(:comision_odt))
  end

  test "should destroy comision_odt" do
    assert_difference('ComisionOdt.count', -1) do
      delete :destroy, id: @comision_odt
    end

    assert_redirected_to comision_odts_path
  end
end
