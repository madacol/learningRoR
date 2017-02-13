class BdvsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bdv, only: [:show, :edit, :update, :destroy]

  # GET /bdvs
  # GET /bdvs.json
  def index
    @pools = Bdv.all
    @new_pool = Bdv.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Bdv"
    render 'layouts/_cuentas_index'
  end

  # GET /bdvs/days/:days
  def days_index
    @pools = Bdv.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Bdv.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Bdv"
    render 'layouts/_cuentas_index'
  end

  # GET /bdvs/1
  # GET /bdvs/1.json
  def show
  end

  # GET /bdvs/new
  def new
    @bdv = Bdv.new
  end

  # GET /pools/modal/1/1/1
  def modal
    if params[:id] == '0' then
      @pool = Bdv.new
      @pool.date_of = Date.today
      modal_id = "new_#{@pool.model_name.singular}"
    else
      @pool = Bdv.find(params[:id])
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

  # GET /bdvs/1/edit
  def edit
  end

  # POST /bdvs
  # POST /bdvs.json
  def create
    @bdv = Bdv.new(bdv_params)
    # ask_for_permission(@bdv, 'create_bdv') and return if current_user.cannot 'create_bdv'
    # Calculate balance and save
    last_bdv = Bdv.last
    (last_bdv.nil? or last_bdv.balance.nil?) ?
      @bdv.balance = @bdv.monto : @bdv.balance = last_bdv.balance + @bdv.monto
    #
    # Extract category, if given
    category = params[:bdv][:category]
    unless category.nil?
      @bdv.category_type, @bdv.category_id = category.split(':')
    end
    #
    respond_to do |format|
      if @bdv.save
        format.html { redirect_back bdvs_url, notice: @bdv.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @bdv }
        format.js { render 'layouts/create', :locals => {:@pool => @bdv} }
      else
        format.html { render :new }
        format.json { render json: @bdv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdvs/1
  # PATCH/PUT /bdvs/1.json
  def update
    @bdv.assign_attributes(bdv_params)
    # ask_for_permission(@bdv, 'update_bdv') and return if current_user.cannot 'update_bdv'
    # Extract category, if given
    category = params[:bdv][:category]
    unless category.nil?
      @bdv.category_type, @bdv.category_id = category.split(':')
    end
    #
    @bdv.save ?
      are_saved = update_balances(@bdv) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back bdvs_url, notice: @bdv.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @bdv }
        format.js { render 'layouts/update', :locals => {:@pool => @bdv} }
      else
        format.html { render :edit }
        format.json { render json: @bdv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdvs/1
  # DELETE /bdvs/1.json
  def destroy
    # ask_for_permission(@bdv, 'destroy_bdv') and return if current_user.cannot 'destroy_bdv'
    @bdv.destroy
    are_saved = update_balances(@bdv)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back bdvs_url, notice: @bdv.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render 'layouts/destroy' }
      else
        format.html { render :edit }
        format.json { render json: @bdv.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bdv
      @bdv = Bdv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bdv_params
      params.require(:bdv).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_factura, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
