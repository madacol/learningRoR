class BanescosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_banesco, only: [:show, :edit, :update, :destroy]

  # GET /banescos
  # GET /banescos.json
  def index
    @pools = Banesco.all
    @new_pool = Banesco.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Banesco"
    render 'layouts/_cuentas_index'
  end

  # GET /banescos/days/:days
  def days_index
    @pools = Banesco.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Banesco.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Banesco"
    render 'layouts/_cuentas_index'
  end

  # GET /banescos/1
  # GET /banescos/1.json
  def show
  end

  # GET /banescos/new
  def new
    @banesco = Banesco.new
  end

  # GET /pools/modal/1/1/1
  def modal
    if params[:id] == '0' then
      @pool = Banesco.new
      @pool.date_of = Date.today
      modal_id = "new_#{@pool.model_name.singular}"
    else
      @pool = Banesco.find(params[:id])
      modal_id = "edit_#{@pool.model_name.singular}_#{@pool.id}"
    end
    locals = {
      :load_button => params[:button] != '0',
      :load_form => params[:form] != '0',
      :modal_id => modal_id,
      :selector_href => request.path,
      :form_to_render => 'layouts/pools_form'
    }
    respond_to do |format|
      format.js { render 'layouts/modal', :locals => locals }
    end
  end

  # GET /banescos/1/edit
  def edit
  end

  # POST /banescos
  # POST /banescos.json
  def create
    @banesco = Banesco.new(banesco_params)
    # ask_for_permission(@banesco, 'create_banesco') and return if current_user.cannot 'create_banesco'
    # Calculate balance and save
    last_banesco = Banesco.last
    (last_banesco.nil? or last_banesco.balance.nil?) ?
      @banesco.balance = @banesco.monto : @banesco.balance = last_banesco.balance + @banesco.monto
    #
    # Calculate balance and save# Extract category, if given
    category = params[:banesco][:category]
    unless category.nil?
      @banesco.category_type, @banesco.category_id = category.split(':')
    end
    #
    respond_to do |format|
      if @banesco.save
        format.html { redirect_back banescos_url, notice: @banesco.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @banesco }
      else
        format.html { render :new }
        format.json { render json: @banesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banescos/1
  # PATCH/PUT /banescos/1.json
  def update
    @banesco.assign_attributes(banesco_params)
    # ask_for_permission(@banesco, 'update_banesco') and return if current_user.cannot 'update_banesco'
    # Extract category, if given
    category = params[:banesco][:category]
    unless category.nil?
      @banesco.category_type, @banesco.category_id = category.split(':')
    end
    #
    @banesco.save ?
      are_saved = update_balances(@banesco) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back banescos_url, notice: @banesco.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
      else
        format.html { render :edit }
        format.json { render json: @banesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banescos/1
  # DELETE /banescos/1.json
  def destroy
    # ask_for_permission(@banesco, 'destroy_banesco') and return if current_user.cannot 'destroy_banesco'
    @banesco.destroy
    are_saved = update_balances(@banesco)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back banescos_url, notice: @banesco.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @banesco.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banesco
      @banesco = Banesco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banesco_params
      params.require(:banesco).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_factura, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
