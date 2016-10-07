class PaymentCardsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_payment_card, only: [:show, :edit, :update, :destroy]

  # GET /payment_cards
  # GET /payment_cards.json
  def index
    # permission_denied and return if current_user.cannot 'read_payment_cards'
    @payment_cards = PaymentCard.all 
    @new_payment_card = PaymentCard.new
    @new_payment_card.status = "Activa"
  end

  # GET /payment_cards/1
  # GET /payment_cards/1.json
  def show
  end

  # GET /payment_cards/new
  def new
    @payment_card = PaymentCard.new
  end

  # GET /payment_cards/1/edit
  def edit
  end

  # POST /payment_cards
  # POST /payment_cards.json
  def create
    @payment_card = PaymentCard.new(payment_card_params)

    respond_to do |format|
      if @payment_card.save
        format.html { redirect_to payment_cards_url, notice: 'Payment card was successfully created.' }
        format.json { render :show, status: :created, location: @payment_card }
      else
        format.html { render :new }
        format.json { render json: @payment_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_cards/1
  # PATCH/PUT /payment_cards/1.json
  def update
    respond_to do |format|
      if @payment_card.update(payment_card_params)
        format.html { redirect_to payment_cards_url, notice: 'Payment card was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_card }
      else
        format.html { render :edit }
        format.json { render json: @payment_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_cards/1
  # DELETE /payment_cards/1.json
  def destroy
    if @payment_card.transactions.empty? and @payment_card.last?
      @payment_card.destroy
      respond_to do |format|
        format.html { redirect_to payment_cards_url, notice: 'Payment card was successfully destroyed.' }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    else
      @payment_card.Inactiva!
      redirect_to payment_cards_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_card
      @payment_card = PaymentCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_card_params
      params.require(:payment_card).permit(:bank, :card_type, :last_digits, :status)
    end
end
