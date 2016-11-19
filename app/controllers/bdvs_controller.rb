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
    render 'layouts/_pools_index'
  end

  # GET /bdvs/days/:days
  def days_index
    @pools = Bdv.where('created_at >= ?', params[:days].to_i.days.ago.beginning_of_day)
    @new_pool = Bdv.new
    @new_pool.date_of = Date.today
    @cierre = Cierre.new
    @cierre.account = "Bdv"
    render 'layouts/_pools_index'
  end

  # GET /bdvs/1
  # GET /bdvs/1.json
  def show
  end

  # GET /bdvs/new
  def new
    @bdv = Bdv.new
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
        format.html { redirect_to bdvs_url, notice: @bdv.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @bdv }
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
        format.html { redirect_to bdvs_url, notice: @bdv.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
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
        format.html { redirect_to bdvs_url, notice: @bdv.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
        format.json { head :no_content }
        format.js   { render :layout => false }
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
      params.require(:bdv).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id, :date_of, :forma_de_pago, :forma_de_pago_nro, :receiver)
    end
end
