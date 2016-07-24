class MercantilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mercantil, only: [:show, :edit, :update, :destroy]


  # GET /mercantils
  # GET /mercantils.json
  def index
    @mercantils = Mercantil.all
    @new_mercantil = Mercantil.new
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

    respond_to do |format|
      if @mercantil.save
        format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' was successfully created.') }
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
    respond_to do |format|
      if @mercantil.update(mercantil_params)
        format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' was successfully updated.') }
        format.json { render :show, status: :ok, location: @mercantil }
      else
        format.html { render :edit }
        format.json { render json: @mercantil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mercantils/1
  # DELETE /mercantils/1.json
  def destroy
    @mercantil.destroy
    respond_to do |format|
      format.html { redirect_to mercantils_url, notice: @mercantil.table_name_to_show.concat(' was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mercantil
      @mercantil = Mercantil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mercantil_params
      params.require(:mercantil).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id)
    end
end
