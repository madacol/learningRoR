class BdvsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bdv, only: [:show, :edit, :update, :destroy]

  # GET /bdvs
  # GET /bdvs.json
  def index
    @pools = Bdv.all
    @new_pool = Bdv.new
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
    respond_to do |format|
      if @bdv.update(bdv_params)
        format.html { redirect_to bdvs_url, notice: @bdv.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @bdv }
      else
        format.html { render :edit }
        format.json { render json: @bdv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdvs/1
  # DELETE /bdvs/1.json
  def destroy
    @bdv.destroy
    respond_to do |format|
      format.html { redirect_to bdvs_url, notice: @bdv.table_name_to_show.concat(' fue eliminado satisfactoriamente.') }
      format.json { head :no_content }
      format.js   { render :layout => false }
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
