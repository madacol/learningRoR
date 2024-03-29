class RetencionesController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_retencione, only: [:show, :edit, :update, :destroy]

  # GET /retenciones
  # GET /retenciones.json
  def index
    permission_denied and return  if current_user.cannot 'read_retencione'
    @retenciones = Retencione.all    
    @new_retencione = Retencione.new
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
    permission_denied and return  if current_user.cannot 'create_retencione'
    @retencione = Retencione.new(retencione_params)

    respond_to do |format|
      if @retencione.save
        format.html { redirect_to retenciones_url, notice: @retencione.table_name_to_show.concat(' fue creada satisfactoriamente.') }
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
    permission_denied and return  if current_user.cannot 'update_retencione'
    respond_to do |format|
      if @retencione.update(retencione_params)
        format.html { redirect_to retenciones_url, notice: @retencione.table_name_to_show.concat( ' fue actualizado satisfactoriamente.') }
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
    permission_denied and return  if current_user.cannot 'destroy_retencione'
    @retencione.destroy
    respond_to do |format|
      format.html { redirect_to retenciones_url, notice: 'Retencione fue eliminado satisfactoriamente.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retencione
      @retencione = Retencione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retencione_params
      params.require(:retencione).permit(:name, :razon_social_id, :tipo, :monto, :description, :status)
    end
end
