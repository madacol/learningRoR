class ProvincialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provincial, only: [:show, :edit, :update, :destroy]

  # GET /provincials
  # GET /provincials.json
  def index
    @pools = Provincial.all
    @new_pool = Provincial.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Provincial"
    render 'layouts/_cuentas_index'
  end

  # GET /provincials/days/:days
  def days_index
    @pools = Provincial.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Provincial.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Provincial"
    render 'layouts/_cuentas_index'
  end

  # GET /provincials/1
  # GET /provincials/1.json
  def show
  end

  # GET /provincials/new
  def new
    @provincial = Provincial.new
  end

  # GET /provincials/1/edit
  def edit
  end

  # POST /provincials
  # POST /provincials.json
  def create
    @provincial = Provincial.new(provincial_params)
    # ask_for_permission(@provincial, 'create_provincial') and return if current_user.cannot 'create_provincial'
    # Calculate balance and save
    last_provincial = Provincial.last
    (last_provincial.nil? or last_provincial.balance.nil?) ?
      @provincial.balance = @provincial.monto : @provincial.balance = last_provincial.balance + @provincial.monto
    #
    # Extract category, if given
    category = params[:provincial][:category]
    unless category.nil?
      @provincial.category_type, @provincial.category_id = category.split(':')
    end
    #
    respond_to do |format|
      if @provincial.save
        format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @provincial }
      else
        format.html { render :new }
        format.json { render json: @provincial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provincials/1
  # PATCH/PUT /provincials/1.json
  def update
    @provincial.assign_attributes(provincial_params)
    # ask_for_permission(@provincial, 'update_provincial') and return if current_user.cannot 'update_provincial'
    # Extract category, if given
    category = params[:provincial][:category]
    unless category.nil?
      @provincial.category_type, @provincial.category_id = category.split(':')
    end
    #
    @provincial.save ?
      are_saved = update_balances(@provincial) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
      else
        format.html { render :edit }
        format.json { render json: @provincial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provincials/1
  # DELETE /provincials/1.json
  def destroy
    # ask_for_permission(@provincial, 'destroy_provincial') and return if current_user.cannot 'destroy_provincial'
    @provincial.destroy
    are_saved = update_balances(@provincial)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @provincial.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provincial
      @provincial = Provincial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provincial_params
      params.require(:provincial).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_factura, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
