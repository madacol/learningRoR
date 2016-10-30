class CierresController < ApplicationController
  before_action :set_cierre, only: [:show, :edit, :update, :destroy]

  # GET /cierres
  # GET /cierres.json
  def index
    @cierres = Cierre.all
  end

  # GET /cierres/1
  # GET /cierres/1.json
  def show
  end

  # GET /cierres/new
  def new
    @cierre = Cierre.new
  end

  # GET /cierres/1/edit
  def edit
  end

  # POST /cierres
  # POST /cierres.json
  def create
    @cierre = Cierre.new(cierre_params)
    pool = eval(@cierre.account).new
    category_record = Gg.find_by(code: 'D-Cuentas')
    category_record ||= Gg.create code: "D-Cuentas", alias: "Diferencia en las cuentas", description: "Lleva el registro de las diferencias presentadas en cualquiera de las cuentas: \"Caja Chica\",\"Banesco\", \"Bdv\", \"Bod\", \"Mercantil\", \"Provincial\"."
    (eval(@cierre.account).last.nil? or eval(@cierre.account).last.balance.nil?) ?
      last_balance = 0 : last_balance = eval(@cierre.account).last.balance
    diferencia_cierre = @cierre.total - last_balance
    if diferencia_cierre != 0
      pool.monto = diferencia_cierre
      pool.balance = pool.monto + last_balance
      pool.category = category_record
      pool.save
    end
    respond_to do |format|
      if @cierre.save
        format.html { redirect_to eval("#{pool.model_name.plural}_url"), notice: 'Cierre was successfully created.' }
        format.json { render :show, status: :created, location: @cierre }
      else
        format.html { render :new }
        format.json { render json: @cierre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cierres/1
  # PATCH/PUT /cierres/1.json
  def update
    respond_to do |format|
      if @cierre.update(cierre_params)
        format.html { redirect_to @cierre, notice: 'Cierre was successfully updated.' }
        format.json { render :show, status: :ok, location: @cierre }
      else
        format.html { render :edit }
        format.json { render json: @cierre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cierres/1
  # DELETE /cierres/1.json
  def destroy
    @cierre.destroy
    respond_to do |format|
      format.html { redirect_to cierres_url, notice: 'Cierre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cierre
      @cierre = Cierre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cierre_params
      params.require(:cierre).permit(:account, :total)
    end
end