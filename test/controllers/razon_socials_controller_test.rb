require 'test_helper'

class RazonSocialsControllerTest < ActionController::TestCase
  setup do
    @razon_social = razon_socials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:razon_socials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create razon_social" do
    assert_difference('RazonSocial.count') do
      post :create, razon_social: { address: @razon_social.address, contact_email: @razon_social.contact_email, contact_name: @razon_social.contact_name, contact_phone: @razon_social.contact_phone, description: @razon_social.description, email: @razon_social.email, name: @razon_social.name, phone: @razon_social.phone, rif_ci: @razon_social.rif_ci }
    end

    assert_redirected_to razon_social_path(assigns(:razon_social))
  end

  test "should show razon_social" do
    get :show, id: @razon_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @razon_social
    assert_response :success
  end

  test "should update razon_social" do
    patch :update, id: @razon_social, razon_social: { address: @razon_social.address, contact_email: @razon_social.contact_email, contact_name: @razon_social.contact_name, contact_phone: @razon_social.contact_phone, description: @razon_social.description, email: @razon_social.email, name: @razon_social.name, phone: @razon_social.phone, rif_ci: @razon_social.rif_ci }
    assert_redirected_to razon_social_path(assigns(:razon_social))
  end

  test "should destroy razon_social" do
    assert_difference('RazonSocial.count', -1) do
      delete :destroy, id: @razon_social
    end

    assert_redirected_to razon_socials_path
  end
end
