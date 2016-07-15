class GgsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_gg, only: [:show, :edit, :update, :destroy]

  # GET /ggs
  # GET /ggs.json
  def index
    permission_denied and return  if current_user.cannot 'read_gg'
    @ggs = Gg.all
    @new_gg = Gg.new
  end

  # GET /ggs/1
  # GET /ggs/1.json
  def show
  end

  # GET /ggs/new
  def new
    @gg = Gg.new
  end

  # GET /ggs/1/edit
  def edit
  end

  # POST /ggs
  # POST /ggs.json
  def create
    permission_denied and return  if current_user.cannot 'create_gg'
    @gg = Gg.new(gg_params)

    respond_to do |format|
      if @gg.save
        format.html { redirect_to ggs_url, notice: @gg.table_name_to_show.concat( ' was successfully created.') }
        format.json { render :show, status: :created, location: @gg }
      else
        format.html { render :new }
        format.json { render json: @gg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ggs/1
  # PATCH/PUT /ggs/1.json
  def update
    respond_to do |format|
      if @gg.update(gg_params)
        format.html { redirect_to ggs_url, notice: @gg.table_name_to_show.concat( ' was successfully updated.') }
        format.json { render :show, status: :ok, location: @gg }
      else
        format.html { render :edit }
        format.json { render json: @gg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ggs/1
  # DELETE /ggs/1.json
  def destroy
    @gg.destroy
    respond_to do |format|
      format.html { redirect_to ggs_url, notice: 'Gg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gg
      @gg = Gg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gg_params
      params.require(:gg).permit(:code, :alias, :description)
    end
end
