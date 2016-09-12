class PoolsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /pools
  # GET /pools.json
  def index
    permission_denied and return if current_user.cannot 'read_pool'
    @pools = Pool.all #where("created_at >= ?", Time.zone.now.beginning_of_day)
    @new_pool = Pool.new
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
    respond_to do |format|
      if @pool.save
        format.html { redirect_to pools_url, notice: @pool.table_name_to_show.concat(' fue creada satisfactoriamente.') }
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
    respond_to do |format|
      if @pool.save
        format.html { redirect_to pools_url, notice: @pool.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
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
   respond_to do |format|
      format.html { redirect_to pools_url, notice: @pool.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_params
      params.require(:pool).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id, :date_of)
    end
end
