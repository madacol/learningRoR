class BodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bod, only: [:show, :edit, :update, :destroy]

  # GET /bods
  # GET /bods.json
  def index
    @bods = Bod.all
    @new_bod = Bod.new
  end

  # GET /bods/1
  # GET /bods/1.json
  def show
  end

  # GET /bods/new
  def new
    @bod = Bod.new
  end

  # GET /bods/1/edit
  def edit
  end

  # POST /bods
  # POST /bods.json
  def create
    @bod = Bod.new(bod_params)

    respond_to do |format|
      if @bod.save
        format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @bod }
      else
        format.html { render :new }
        format.json { render json: @bod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bods/1
  # PATCH/PUT /bods/1.json
  def update
    respond_to do |format|
      if @bod.update(bod_params)
        format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @bod }
      else
        format.html { render :edit }
        format.json { render json: @bod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bods/1
  # DELETE /bods/1.json
  def destroy
    @bod.destroy
    respond_to do |format|
      format.html { redirect_to bods_url, notice: @bod.table_name_to_show.concat(' fue eliminado satisfactoriamente.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bod
      @bod = Bod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bod_params
      params.require(:bod).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id)
    end
end
