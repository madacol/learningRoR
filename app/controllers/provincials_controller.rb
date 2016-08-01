class ProvincialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provincial, only: [:show, :edit, :update, :destroy]

  # GET /provincials
  # GET /provincials.json
  def index
    @provincials = Provincial.all
    @new_provincial = Provincial.new
  end

  # GET /provincials/1
  # GET /provincials/1.json
  def show
  end

  # GET /provincials/new
  def new
    @provincial = Provincial.new
  end

  # GET /provincials/1/edit
  def edit
  end

  # POST /provincials
  # POST /provincials.json
  def create
    @provincial = Provincial.new(provincial_params)

    respond_to do |format|
      if @provincial.save
        format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @provincial }
      else
        format.html { render :new }
        format.json { render json: @provincial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provincials/1
  # PATCH/PUT /provincials/1.json
  def update
    respond_to do |format|
      if @provincial.update(provincial_params)
        format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @provincial }
      else
        format.html { render :edit }
        format.json { render json: @provincial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provincials/1
  # DELETE /provincials/1.json
  def destroy
    @provincial.destroy
    respond_to do |format|
      format.html { redirect_to provincials_url, notice: @provincial.table_name_to_show.concat(' fue eliminado satisfactoriamente.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provincial
      @provincial = Provincial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provincial_params
      params.require(:provincial).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id)
    end
end
