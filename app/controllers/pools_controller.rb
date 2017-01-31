class PoolsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /pools
  # GET /pools.json
  def index
    @pools = Pool.all
    @new_pool = Pool.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Pool"
    render 'layouts/_pools_index'
  end

  # GET /pools/days/:days
  def days_index
    @pools = Pool.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Pool.new
    @new_pool.date_of = Date.today
    @new_pool.forma_de_pago = "Efectivo"
    @cierre = Cierre.new
    @cierre.account = "Pool"
    render 'layouts/_pools_index'
  end

  # GET /pools/1
  # GET /pools/1.json
  def show
  end

  # GET /pools/new
  def new
    @pool = Pool.new
  end

  # GET /pools/1/edit
  def edit
  end

  # POST /pools
  # POST /pools.json
  def create
    @pool = Pool.new(pool_params)
    ask_for_permission(@pool, 'create_pool') and return if current_user.cannot 'create_pool'
    # Calculate balance and save
    last_pool = Pool.last
    (last_pool.nil? or last_pool.balance.nil?) ?
      @pool.balance = @pool.monto : @pool.balance = last_pool.balance + @pool.monto
    #
    # Extract category, if given
    category = params[:pool][:category]
    unless category.nil?
      @pool.category_type, @pool.category_id = category.split(':')
    end
    #
    respond_to do |format|
      if @pool.save
        format.html { redirect_back pools_url, notice: @pool.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @pool }
      else
        format.html { render :new }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pools/1
  # PATCH/PUT /pools/1.json
  def update
    @pool.assign_attributes(pool_params)
    ask_for_permission(@pool, 'update_pool') and return if current_user.cannot 'update_pool'
    # Extract category, if given
    category = params[:pool][:category]
    unless category.nil?
      @pool.category_type, @pool.category_id = category.split(':')
    end
    @pool.save ?
      are_saved = update_balances(@pool) : are_saved = [false]
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back pools_url, notice: @pool.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @pool }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.json
  def destroy
    ask_for_permission(@pool, 'destroy_pool') and return if current_user.cannot 'destroy_pool'
    @pool.destroy
    are_saved = update_balances(@pool)
    respond_to do |format|
      if are_saved.all?
        format.html { redirect_back pools_url, notice: @pool.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_params
      params.require(:pool).permit(:category_id, :category_type, :monto, :cuenta, :comprobante_type, :n_factura, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
