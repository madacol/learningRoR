class BanescosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_banesco, only: [:show, :edit, :update, :destroy]

  # GET /banescos
  # GET /banescos.json
  def index
    @pools = Banesco.all
    @new_pool = Banesco.new
    render 'layouts/_pools_index'
  end

  # GET /banescos/1
  # GET /banescos/1.json
  def show
  end

  # GET /banescos/new
  def new
    @banesco = Banesco.new
  end

  # GET /banescos/1/edit
  def edit
  end

  # POST /banescos
  # POST /banescos.json
  def create
    @banesco = Banesco.new(banesco_params)

    respond_to do |format|
      if @banesco.save
        format.html { redirect_to banescos_url, notice: @banesco.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @banesco }
      else
        format.html { render :new }
        format.json { render json: @banesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banescos/1
  # PATCH/PUT /banescos/1.json
  def update
    respond_to do |format|
      if @banesco.update(banesco_params)
        format.html { redirect_to banescos_url, notice: @banesco.table_name_to_show.concat(' fue creada satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @banesco }
      else
        format.html { render :edit }
        format.json { render json: @banesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banescos/1
  # DELETE /banescos/1.json
  def destroy
    @banesco.destroy
    respond_to do |format|
      format.html { redirect_to banescos_url, notice: @banesco.table_name_to_show.concat(' fue eliminado satisfactoriamente.')}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banesco
      @banesco = Banesco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banesco_params
      params.require(:banesco).permit(:category_id, :category_type, :monto, :balance, :cuenta, :comprobante_type, :n_comprobante, :description, :razon_social_id, :date_of)
    end
end
