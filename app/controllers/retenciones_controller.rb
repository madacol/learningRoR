class RetencionesController < ApplicationController
  before_action :set_retencione, only: [:show, :edit, :update, :destroy]

  # GET /retenciones
  # GET /retenciones.json
  def index
    @retenciones = Retencione.all
  end

  # GET /retenciones/1
  # GET /retenciones/1.json
  def show
  end

  # GET /retenciones/new
  def new
    @retencione = Retencione.new
  end

  # GET /retenciones/1/edit
  def edit
  end

  # POST /retenciones
  # POST /retenciones.json
  def create
    @retencione = Retencione.new(retencione_params)

    respond_to do |format|
      if @retencione.save
        format.html { redirect_to @retencione, notice: 'Retencione was successfully created.' }
        format.json { render :show, status: :created, location: @retencione }
      else
        format.html { render :new }
        format.json { render json: @retencione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retenciones/1
  # PATCH/PUT /retenciones/1.json
  def update
    respond_to do |format|
      if @retencione.update(retencione_params)
        format.html { redirect_to @retencione, notice: 'Retencione was successfully updated.' }
        format.json { render :show, status: :ok, location: @retencione }
      else
        format.html { render :edit }
        format.json { render json: @retencione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retenciones/1
  # DELETE /retenciones/1.json
  def destroy
    @retencione.destroy
    respond_to do |format|
      format.html { redirect_to retenciones_url, notice: 'Retencione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retencione
      @retencione = Retencione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retencione_params
      params.require(:retencione).permit(:code_factura, :razon_social_id, :tipo, :monto, :description, :status)
    end
end
