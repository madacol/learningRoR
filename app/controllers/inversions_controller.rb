class InversionsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_inversion, only: [:show, :edit, :update, :destroy]

  # GET /inversions
  # GET /inversions.json
  def index
    permission_denied and return  if current_user.cannot 'read_inversion'
    @inversions = Inversion.all
    @new_inversion = Inversion.new
  end

  # GET /inversions/1
  # GET /inversions/1.json
  def show
  end

  # GET /inversions/new
  def new
    @inversion = Inversion.new
  end

  # GET /inversions/1/edit
  def edit
  end

  # POST /inversions
  # POST /inversions.json
  def create
    permission_denied and return  if current_user.cannot 'create_inversion'
    @inversion = Inversion.new(inversion_params)

    respond_to do |format|
      if @inversion.save
        format.html { redirect_to inversions_url, notice: @inversion.table_name_to_show.concat( ' fue creada satisfactoriamente.') }
        format.json { render :show, status: :created, location: @inversion }
      else
        format.html { render :new }
        format.json { render json: @inversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inversions/1
  # PATCH/PUT /inversions/1.json
  def update
    permission_denied and return  if current_user.cannot 'update_inversion'
    respond_to do |format|
      if @inversion.update(inversion_params)
        format.html { redirect_to inversion_url, notice: @inversion.table_name_to_show.concat( ' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @inversion }
      else
        format.html { render :edit }
        format.json { render json: @inversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inversions/1
  # DELETE /inversions/1.json
  def destroy
    permission_denied and return  if current_user.cannot 'destroy_inversion'
    @inversion.destroy
    respond_to do |format|
      format.html { redirect_to inversions_url, notice: 'Inversion fue eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inversion
      @inversion = Inversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inversion_params
      params.require(:inversion).permit(:code, :description, :alias)
    end
end
