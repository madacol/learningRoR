class MercantilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mercantil, only: [:show, :edit, :update, :destroy]

  # GET /mercantils
  # GET /mercantils.json
  def index
    @pools = Mercantil.all
    @new_pool = Mercantil.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Mercantil"
    render 'layouts/_pools_index'
  end

  # GET /mercantils/days/:days
  def days_index
    @pools = Mercantil.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Mercantil.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Mercantil"
    render 'layouts/_pools_index'
  end

  # GET /mercantils/1
  # GET /mercantils/1.json
  def show
  end

  # GET /mercantils/new
  def new
    @mercantil = Mercantil.new
  end

  # GET /mercantils/1/edit
  def edit
  end

  # POST /mercantils
  # POST /mercantils.json
  def create
    @mercantil = Mercantil.new(mercantil_params)
    # ask_for_permission(@mercantil, 'create_mercantil') and return if current_user.cannot 'create_mercantil'
    # Calculate balance and save
    last_mercantil = Mercantil.last
    (last_mercantil.nil? or last_mercantil.balance.nil?) ?
      @mercantil.balance = @mercantil.monto : @mercantil.balance = last_mercantil.balance + @mercantil.monto
    #
    # Extract category, if given
    category = params[:mercantil][:category]
    unless category.nil?
      @mercantil.category_type, @mercantil.category_id = category.split(':')
    end
    #
    respond_to do |format|
      if @mercantil.save
        format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @mercantil }
      else
        format.html { render :new }
        format.json { render json: @mercantil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mercantils/1
  # PATCH/PUT /mercantils/1.json
  def update
    @mercantil.assign_attributes(mercantil_params)
    # ask_for_permission(@mercantil, 'update_mercantil') and return if current_user.cannot 'update_mercantil'
    # Extract category, if given
    category = params[:mercantil][:category]
    unless category.nil?
      @mercantil.category_type, @mercantil.category_id = category.split(':')
    end
    #
    @mercantil.save ?
      are_saved = update_balances(@mercantil) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
      else
        format.html { render :edit }
        format.json { render json: @mercantil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mercantils/1
  # DELETE /mercantils/1.json
  def destroy
    # ask_for_permission(@mercantil, 'destroy_mercantil') and return if current_user.cannot 'destroy_mercantil'
    @mercantil.destroy
    are_saved = update_balances(@mercantil)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @mercantil.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mercantil
      @mercantil = Mercantil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mercantil_params
      params.require(:mercantil).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
