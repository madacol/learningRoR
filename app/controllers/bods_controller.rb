class BodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bod, only: [:show, :edit, :update, :destroy]

  # GET /bods
  # GET /bods.json
  def index
    @pools = Bod.all
    @new_pool = Bod.new
    @cierre = Cierre.new
    @cierre.account = "Bod"
    render 'layouts/_pools_index'
  end

  # GET /bods/1
  # GET /bods/1.json
  def show
  end

  # GET /bods/new
  def new
    @bod = Bod.new
  end

  # GET /bods/1/edit
  def edit
  end

  # POST /bods
  # POST /bods.json
  def create
    @bod = Bod.new(bod_params)
    # ask_for_permission(@bod, 'create_bod') and return if current_user.cannot 'create_bod'
    last_bod = Bod.last
    (last_bod.nil? or last_bod.balance.nil?) ?
      @bod.balance = @bod.monto : @bod.balance = last_bod.balance + @bod.monto
    respond_to do |format|
      if @bod.save
        format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @bod }
      else
        format.html { render :new }
        format.json { render json: @bod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bods/1
  # PATCH/PUT /bods/1.json
  def update
    @bod.assign_attributes(bod_params)
    # ask_for_permission(@bod, 'update_bod') and return if current_user.cannot 'update_bod'
    @bod.save ?
      are_saved = update_balances(@bod) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
      else
        format.html { render :edit }
        format.json { render json: @bod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bods/1
  # DELETE /bods/1.json
  def destroy
    # ask_for_permission(@bod, 'destroy_bod') and return if current_user.cannot 'destroy_bod'
    @bod.destroy
    are_saved = update_balances(@bod)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @bod.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bod
      @bod = Bod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bod_params
      params.require(:bod).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
