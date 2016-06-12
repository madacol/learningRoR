class OdtsController < ApplicationController
  before_action :set_odt, only: [:show, :edit, :update, :destroy]

  # GET /odts
  # GET /odts.json
  def index
    @odts = Odt.all
    @odt = Odt.new
    @odt.comision_odts.build
  end

  # GET /odts/1
  # GET /odts/1.json
  def show
  end

  # GET /odts/new
  def new
    @odt = Odt.new
  end

  # GET /odts/1/edit
  def edit
  end

  # POST /odts
  # POST /odts.json
  def create
    @odt = Odt.new(odt_params)

    respond_to do |format|
      if @odt.save
        format.html { redirect_to odts_url, notice: @odt.table_name_to_show.concat(' was successfully created.') }
        format.json { render :show, status: :created, location: @odt }
      else
        format.html { render :new }
        format.json { render json: @odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odts/1
  # PATCH/PUT /odts/1.json
  def update
    respond_to do |format|
      if @odt.update(odt_params)
        format.html { redirect_to odts_url, notice: @odt.table_name_to_show.concat(' was successfully updated.') }
        format.json { render :show, status: :ok, location: @odt }
      else
        format.html { render :edit }
        format.json { render json: @odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odts/1
  # DELETE /odts/1.json
  def destroy
    @odt.destroy
    respond_to do |format|
      format.html { redirect_to odts_url, notice: 'Odt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odt
      @odt = Odt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odt_params
      params.require(:odt).permit(:code, :alias, :description, :razon_social_id, :monto_contrato, comision_odts_attributes: [:id, :p_comision, :employee_id, :_destroy])
    end
end
