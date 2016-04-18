require 'test_helper'

class PoolsControllerTest < ActionController::TestCase
  setup do
    @pool = pools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pool" do
    assert_difference('Pool.count') do
      post :create, pool: { balance: @pool.balance, description: @pool.description, gg_id: @pool.gg_id, inversion_id: @pool.inversion_id, loan_id: @pool.loan_id, monto: @pool.monto, n_comprobante: @pool.n_comprobante, odt_id: @pool.odt_id, retencione_id: @pool.retencione_id }
    end

    assert_redirected_to pool_path(assigns(:pool))
  end

  test "should show pool" do
    get :show, id: @pool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pool
    assert_response :success
  end

  test "should update pool" do
    patch :update, id: @pool, pool: { balance: @pool.balance, description: @pool.description, gg_id: @pool.gg_id, inversion_id: @pool.inversion_id, loan_id: @pool.loan_id, monto: @pool.monto, n_comprobante: @pool.n_comprobante, odt_id: @pool.odt_id, retencione_id: @pool.retencione_id }
    assert_redirected_to pool_path(assigns(:pool))
  end

  test "should destroy pool" do
    assert_difference('Pool.count', -1) do
      delete :destroy, id: @pool
    end

    assert_redirected_to pools_path
  end
end
