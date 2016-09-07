class DeduccionesOdtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deducciones_odt, only: [:show, :edit, :update, :destroy]

  # GET /deducciones_odts
  # GET /deducciones_odts.json
  def index
    permission_denied and return  if current_user.cannot 'read_deduccion_odt'
    @deducciones_odts = DeduccionesOdt.all
    @new_deduccion_odt = DeduccionOdt.new
  end
  # GET /deducciones_odts/1
  # GET /deducciones_odts/1.json
  def show
  end

  # GET /deducciones_odts/new
  def new
    @deducciones_odt = DeduccionesOdt.new
  end
  # GET /deducciones_odts/1/edit
  def edit
  end

  # POST /deducciones_odts
  # POST /deducciones_odts.json
  def create
    permission_denied and return  if current_user.cannot 'create_deduccion_odt'
    @deducciones_odt = DeduccionesOdt.new(deducciones_odt_params)

    respond_to do |format|
      if @deducciones_odt.save
        format.html { redirect_to deducciones_odts_url, notice: 'Deducciones odt fue creada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @deducciones_odt }
      else
        format.html { render :new }
        format.json { render json: @deducciones_odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deducciones_odts/1
  # PATCH/PUT /deducciones_odts/1.json
  def update
    permission_denied and return  if current_user.cannot 'update_deduccion_odt'
    respond_to do |format|
      if @deducciones_odt.update(deducciones_odt_params)
        format.html { redirect_to deducciones_odts_url, notice: 'Deducciones odt fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @deducciones_odt }
      else
        format.html { render :edit }
        format.json { render json: @deducciones_odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deducciones_odts/1
  # DELETE /deducciones_odts/1.json
  def destroy
    permission_denied and return  if current_user.cannot 'destroy_deduccion_odt'
    @deducciones_odt.destroy
    respond_to do |format|
      format.html { redirect_to deducciones_odts_url, notice: 'Deducciones odt fue eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deducciones_odt
      @deducciones_odt = DeduccionesOdt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deducciones_odt_params
      params.require(:deducciones_odt).permit(:odt_id, :name, :p_gasto)
    end
end
