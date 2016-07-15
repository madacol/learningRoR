class ComisionOdtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comision_odt, only: [:show, :edit, :update, :destroy]

  # GET /comision_odts
  # GET /comision_odts.json
  def index
    permission_denied and return  if current_user.cannot 'read_comision_odt'
    @comision_odts = ComisionOdt.all    
    @new_comision_odt = ComisionOdt.new
  end

  # GET /comision_odts/1
  # GET /comision_odts/1.json
  def show
  end

  # GET /comision_odts/new
  def new
    @comision_odt = ComisionOdt.new
  end

  # GET /comision_odts/1/edit
  def edit
  end

  # POST /comision_odts
  # POST /comision_odts.json
  def create
    permission_denied and return  if current_user.cannot 'create_comision_odt'
    @comision_odt = ComisionOdt.new(comision_odt_params)

    respond_to do |format|
      if @comision_odt.save
        format.html { redirect_to comision_odts_url, notice: @comision_odt.table_name_to_show.concat(' was successfully created.') }
        format.json { render :show, status: :created, location: @comision_odt }
      else
        format.html { render :new }
        format.json { render json: @comision_odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comision_odts/1
  # PATCH/PUT /comision_odts/1.json
  def update
    permission_denied and return  if current_user.cannot 'update_comision_odt'
    respond_to do |format|
      if @comision_odt.update(comision_odt_params)
        format.html { redirect_to comision_odts_url, notice: @comision_odt.table_name_to_show.concat(' was successfully updated.') }
        format.json { render :show, status: :ok, location: @comision_odt }
      else
        format.html { render :edit }
        format.json { render json: @comision_odt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comision_odts/1
  # DELETE /comision_odts/1.json
  def destroy
    @comision_odt.destroy
    respond_to do |format|
      format.html { redirect_to comision_odts_url, notice: 'Comision odt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comision_odt
      @comision_odt = ComisionOdt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comision_odt_params
      params.require(:comision_odt).permit(:odt_id, :employee_id, :p_comision)
    end
end
