require 'test_helper'

class PaymentCardsControllerTest < ActionController::TestCase
  setup do
    @payment_card = payment_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_card" do
    assert_difference('PaymentCard.count') do
      post :create, payment_card: { bank_id: @payment_card.bank_id, bank_type: @payment_card.bank_type, last_digits: @payment_card.last_digits, status: @payment_card.status, type: @payment_card.type }
    end

    assert_redirected_to payment_card_path(assigns(:payment_card))
  end

  test "should show payment_card" do
    get :show, id: @payment_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_card
    assert_response :success
  end

  test "should update payment_card" do
    patch :update, id: @payment_card, payment_card: { bank_id: @payment_card.bank_id, bank_type: @payment_card.bank_type, last_digits: @payment_card.last_digits, status: @payment_card.status, type: @payment_card.type }
    assert_redirected_to payment_card_path(assigns(:payment_card))
  end

  test "should destroy payment_card" do
    assert_difference('PaymentCard.count', -1) do
      delete :destroy, id: @payment_card
    end

    assert_redirected_to payment_cards_path
  end
end
